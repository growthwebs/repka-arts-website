# Redirect-Only Solution - Fix 404 Errors

## Goal

✅ **Keep your current Shopify international structure exactly as is**  
✅ **Only fix the 404 errors via redirects**  
❌ **Won't change any language or market settings**

## The Plan

### Step 1: Old `/artwork/` URLs → New Product URLs

From your 404 list, I see URLs like:
- `https://www.repkaarts.com/artwork/serenity-in-bloom-n1`
- `https://www.repkaarts.com/artwork/mountain-shimmer-oil-painting`

These need to redirect to:
- `https://repkaarts.com/products/serenity-in-bloom-n1` (or the correct international variant)

### Step 2: Old Legacy Pages → New Pages

Pages like:
- `/art/ceramics` → redirect
- `/series/savannah-vibes` → `/collections/savannah-vibes`
- `/resources` → homepage or appropriate page

### Step 3: Handle International URLs

For the international URLs that are 404ing (`es-int/products/`, etc.), we need to either:
- Let them naturally resolve (if they work now)
- Or redirect them to working versions

## What I Need From You

To create the redirect file, I need to know:

**Question 1**: Do your current product handles match the old artwork names?

For example:
- Old: `/artwork/serenity-in-bloom-n1`
- Current product: Is it `/products/serenity-in-bloom-n1`?

If yes: I can create a bulk redirect file automatically.

If no: I'll need you to export your current product list from Shopify.

**Question 2**: Can you export your current products list?

In Shopify Admin:
1. Go to **Products**
2. Click **Export** (or use Shopify's export feature)
3. This will give me the current product handles
4. Then I can match them to the old artwork URLs

## The Process

Once I have the product list:

1. I'll match old artwork URLs to current product URLs
2. Create a CSV file of redirects in this format:
   ```
   Old URL,New URL
   /artwork/serenity-in-bloom-n1,/products/serenity-in-bloom-n1
   /artwork/mountain-shimmer,/products/mountain-shimmer
   ```
3. You'll import this into Shopify URL Redirects
4. This will fix the 404s

## What About the International URLs?

For the international product URLs that are 404ing:
- They might be old URLs from a previous market configuration
- Or they might be incorrectly generated
- We'll handle these separately after fixing the artwork redirects

## Next Step

**Can you export your product list from Shopify?** 

It's usually:
- Shopify Admin → Products → Export → CSV

Once you have that, I can create the redirect file for you!

Or, if you prefer:
- Just tell me if product handles match artwork names (serenity-in-bloom-n1 = serenity-in-bloom-n1)
- And I can create a simpler bulk redirect rule

Let me know which works for you! 🚀
