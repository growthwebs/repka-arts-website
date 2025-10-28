#!/usr/bin/env python3
"""
Generate redirect rules for 404 URLs
Matches old /artwork/ URLs to current product handles
"""

import csv
import re

# Read product handles from export
product_handles = set()
with open('/Users/mapernia/Downloads/products_export_1.csv', 'r') as f:
    reader = csv.DictReader(f)
    for row in reader:
        if row['Handle']:
            product_handles.add(row['Handle'])

print(f"Found {len(product_handles)} product handles")

# Read 404 URLs
redirects = []

with open('/Users/mapernia/Downloads/repkaarts.com-Coverage-Drilldown-2025-10-27/Table.csv', 'r') as f:
    reader = csv.DictReader(f)
    for row in reader:
        url = row['URL']
        
        # Extract /artwork/ URLs
        if '/artwork/' in url:
            # Extract artwork name
            match = re.search(r'/artwork/([^/?]+)', url)
            if match:
                artwork_name = match.group(1)
                
                # Try to find matching product handle
                # Clean up the artwork name to match handle format
                # e.g., "serenity-in-bloom-n1-floating-water-lily-painting" -> "serenity-in-bloom-n1"
                clean_name = re.sub(r'-floating-water-lily-painting$', '', artwork_name)
                clean_name = re.sub(r'-oil-painting$', '', clean_name)
                clean_name = re.sub(r'-watercolour-painting$', '', clean_name)
                clean_name = re.sub(r'-minimalist-abstract-painting$', '', clean_name)
                clean_name = re.sub(r'-mixed-media-painting$', '', clean_name)
                clean_name = re.sub(r'-giraffe-oil-painting$', '', clean_name)
                clean_name = re.sub(r'-sunset-oil-painting$', '', clean_name)
                clean_name = re.sub(r'-textured-abstract-painting$', '', clean_name)
                clean_name = re.sub(r'-impressionist-desert-painting$', '', clean_name)
                clean_name = re.sub(r'-landscape-watercolour$', '', clean_name)
                clean_name = re.sub(r'-large-mixed-media-painting$', '', clean_name)
                clean_name = re.sub(r'-mediterranean-fish-vase$', '', clean_name)
                clean_name = re.sub(r'-street-scene-watercolour$', '', clean_name)
                clean_name = re.sub(r'-watercolour$', '', clean_name)
                
                # Check if this matches a product handle
                if clean_name in product_handles:
                    old_path = f"/artwork/{artwork_name}"
                    new_path = f"/products/{clean_name}"
                    redirects.append((old_path, new_path))
                else:
                    # If no exact match, try just the cleaned name
                    if clean_name not in [r[1].replace('/products/', '') for r in redirects]:
                        print(f"Warning: No product match for artwork: {artwork_name} (cleaned: {clean_name})")
        
        # Legacy pages
        elif '/art/' in url or '/series/' in url or url.endswith('/ceramics') or url.endswith('/about'):
            # Skip these for now, handle separately
            pass

print(f"\nGenerated {len(redirects)} redirects")

# Write redirect CSV
with open('/Users/mapernia/Downloads/redirects_shopify.csv', 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerow(['Old URL', 'New URL'])
    
    for old, new in redirects:
        writer.writerow([old, new])

print(f"\nCreated redirect file: /Users/mapernia/Downloads/redirects_shopify.csv")
print(f"Total redirects: {len(redirects)}")
