# Solution: Keep International URLs, Fix 404 Errors

## Your Situation

✅ You want to keep the international URL structure (as Shopify recommends)  
❌ But these international URLs are returning 404 errors in Google Search Console  
❌ About 901 URLs total, with ~70% being internationalized product URLs

## The Real Problem

The issue isn't that you need to change your URL structure. The issue is likely:

1. **Old URLs still being discovered**: Google is finding old URLs from your previous website structure
2. **Old `/artwork/` URLs**: These need redirects to the new product URLs
3. **Market URLs that may have changed**: If you changed your market configuration, old market URLs now 404

## Solution: Strategic Redirects

Instead of changing your international URL structure, we need to:

### 1. Fix Old `/artwork/` URLs (About 180 URLs)

These are the old website structure URLs that need to redirect to the new product URLs.

**Action**: Create redirects from `/artwork/{name}` → `/products/{name}`

### 2. Fix Old Legacy Pages (About 45 URLs)

Pages like:
- `/art/sold-works` → redirect to appropriate page
- `/series/savannah-vibes` → redirect to `/collections/savannah-vibes`
- `/resources` → redirect to homepage or relevant page

### 3. Let International URLs Work Naturally

For the international product URLs (`es-int/products/`, `en-es/products/`, etc.), these should work if:
- Your markets are properly configured
- Products are published to those markets
- Products have translations in those languages

If these are 404ing, it might be because:
- They're being generated incorrectly in the sitemap
- Or they're old URLs from a previous market configuration

## Next Steps

### For the Old `/artwork/` URLs:

I need you to check:
1. **Do the old artwork names match your current product handles?**
   - Example: Does `/artwork/serenity-in-bloom-n1` match a current product named "serenity-in-bloom-n1"?
   - If yes, I can help you create bulk redirects

2. **If you're unsure**, I can help you:
   - Export a list of your current products
   - Match them to the old artwork URLs
   - Create the redirect CSV for Shopify

### For the International URLs:

We need to determine if they're actually valid or just old invalid URLs:
1. **Are your products currently accessible at international URLs?**
   - Try visiting: `repkaarts.com/es/products/some-product-name`
   - Does it work?
2. **If they don't work**, you might need to either:
   - Fix your market configuration
   - Or create redirects from the broken international URLs to the working URLs

## My Recommendation

Focus on the **old `/artwork/` URLs first** because:
1. These are clearly from your old website structure
2. They can be systematically redirected
3. This will fix ~180 of the 901 404 errors

For the international URLs:
- Check if they currently work on your site
- If they work, the GSC errors might be from old crawl data that will resolve
- If they don't work, we'll need to figure out why they're being generated

## Quick Check

Can you try visiting these URLs on your site right now:
1. `repkaarts.com/es/products/lilies-art-print` - Does it work?
2. `repkaarts.com/en/products/lilies-art-print` - Does it work?
3. `repkaarts.com/products/lilies-art-print` - Does it work?
4. `repkaarts.com/es-int/products/lilies-art-print` - Does it work?

This will tell us if:
- International URLs are working (then GSC errors are stale)
- Or if there's an issue with how they're being generated/served

**Can you test those URLs and let me know which ones work?** 🙏
