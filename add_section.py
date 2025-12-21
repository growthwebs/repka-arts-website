import json
import re

try:
    with open('templates/index.json', 'r') as f:
        content = f.read()

    # Find the start of the JSON object
    json_start = content.find('{')
    if json_start == -1:
        raise Exception("No JSON object found")
        
    header = content[:json_start]
    json_content = content[json_start:]
    
    data = json.loads(json_content)

    # Find existing reviews section
    if 'reviews_carousel' in data['sections']:
        old_section = data['sections']['reviews_carousel']
        
        # Create new section structure
        new_section = {
            "type": "rich-testimonials",
            "blocks": old_section['blocks'], # Copy existing reviews!
            "block_order": old_section['block_order'],
            "settings": {
                "heading": "Loved by collectors worldwide (New)",
                "heading_size": "h1",
                "heading_alignment": "center",
                "columns_desktop": 3,
                "color_scheme": "scheme-1",
                "padding_top": 96,
                "padding_bottom": 96,
                # Buttons
                "button_label_1": "Leave a review",
                "button_link_1": "https://g.page/r/CayzyjuKe2f6EBM/review",
                "button_style_secondary_1": True,
                "button_label_2": "Find your art piece",
                "button_link_2": "shopify://collections",
                "button_style_secondary_2": False
            }
        }
        
        # Add to sections
        data['sections']['rich_testimonials_new'] = new_section
        
        # Add to order
        if 'order' in data: 
            order = data['order']
            try:
                idx = order.index('reviews_carousel')
                order.insert(idx + 1, 'rich_testimonials_new')
            except ValueError:
                order.append('rich_testimonials_new')
        
        # Write back with header
        with open('templates/index.json', 'w') as f:
            f.write(header)
            f.write(json.dumps(data, indent=2))
            
        print("Successfully added rich_testimonials_new to index.json")

except Exception as e:
    print(f"Error: {e}")
