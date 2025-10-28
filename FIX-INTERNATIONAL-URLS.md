# Fix International URLs - Keep Your Languages

## Current Situation

You have:
- ✅ English, French, Spanish variants (keeping them)
- ❌ But international URLs are returning 404

URLs like:
- `repkaarts.com/es-int/products/lilies-art-print` → 404
- `repkaarts.com/en-es/products/serenity-in-bloom-n3` → 404
- `repkaarts.com/fr-eu/products/ostriches` → 404

## Question: Why are these URLs being generated?

The pattern `{lang}-{region}` suggests Shopify Markets might be configured, but the URLs might not be working correctly.

## Diagnosis Steps

### Step 1: Check Your Current Working URLs

**What I need to know**:
1. What does a **valid** product URL look like on your site right now?

Examples:
- Is it: `repkaarts.com/products/lilies-art-print` (no language prefix)?
- Or: `repkaarts.com/en/products/lilies-art-print`?
- Or: `repkaarts.com/es/products/lilies-art-print`?
- Or something else?

### Step 2: Check Your Shopify Markets Configuration

1. Go to **Shopify Admin** → **Settings** → **Markets**
2. What markets do you see configured?
   - Example: "Europe", "North America", "International"?
3. For each market, what languages are enabled?

### Step 3: Check Your Locales

1. Go to **Shopify Admin** → **Settings** → **Languages**
2. What languages are published?
   - English (en)
   - French (fr)
   - Spanish (es)
3. Are all products translated in all languages?

## Why URLs Might Be 404ing

Possible causes:

### Cause 1: Markets Not Properly Configured
- Markets might be set up but products aren't published to those markets
- Or products don't have content in those languages

**How to check**:
1. Go to a product in admin
2. Check "Markets" section
3. Are all markets checked?
4. Check "Translations" section
5. Does each language have content?

### Cause 2: URL Structure Mismatch
- Your sitemap might be generating URLs with `{lang}-{region}` structure
- But Shopify might be serving content at a different URL structure

### Cause 3: Markets Were Changed
- You may have had different markets configured before
- Created URLs with old market structure
- Then changed markets
- Now old URLs 404

## Solutions

### Solution A: Ensure Products Are Published to All Markets

For each product:
1. Go to Shopify Admin → Products
2. Open a product
3. Scroll to "Markets" section
4. Ensure all markets are checked
5. Go to "Translations" section
6. Ensure each language has:
   - Title
   - Description
   - Images (if used)

### Solution B: Fix URL Generation

If your markets are creating URLs like `/es-int/` but Shopify serves them at `/es/`:

1. Go to **Shopify Admin** → **Settings** → **Markets**
2. Check the "Domains" or "URLs" for each market
3. Ensure URL structure matches what's being generated in sitemap

### Solution C: Add Redirects for Old Market Structure

If you changed market structure and old URLs exist:

1. Create redirect mapping from old structure to new structure
2. Example: `es-int/products/` → `es/products/`
3. Import into Shopify URL redirects

## Quick Test

**To diagnose the issue right now**:

1. **Visit your site**: What does a valid product URL look like?
   - Try: `repkaarts.com/products/lilies-art-print` (or any product)
   - Does it work?
   - If yes, what's the exact URL structure?

2. **Check if products have translations**:
   - In Shopify Admin, open any product
   - Look for the language switcher or translations section
   - Can you see translations for EN, FR, ES?

3. **Try accessing a product in different languages**:
   - If your site has a language switcher, try switching languages
   - What URL does it generate?
   - Does it match the pattern in the 404 list?

## Immediate Actions

### Action 1: Share Your Working URL Structure

Tell me:
- What does a **working** product URL look like on your site?
- Example: `repkaarts.com/products/something` or `repkaarts.com/es/products/something`?

### Action 2: Check One Product's Markets

In Shopify Admin:
1. Go to Products
2. Open any product
3. Tell me:
   - What markets are checked?
   - What languages have translations?
   - What URLs would this product have?

### Action 3: Check Your Markets Setup

In Shopify Admin → Settings → Markets:
1. How many markets are configured?
2. What are their names?
3. What domains/URLs are they using?

## Next Steps

Once I know:
1. Your working URL structure
2. Your markets configuration
3. Whether products have translations in all languages

I can:
- Create the exact redirect rules needed
- Fix the URL generation issue
- Ensure international URLs work properly

**Can you share this information?** 🤔
