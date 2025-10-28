# Website Migration: Wix → Shopify - Google Search Console Guide

## Your Situation

- **Old site (Wix)**: Used `/artwork/` URLs, different structure
- **New site (Shopify)**: Uses `/products/` URLs, different structure  
- **Problem**: Google still trying to index old Wix URLs (901 pages returning 404)

## Solution: Tell Google Your Site Changed

### Option 1: URL Removal Tool (Fastest - Use This First) ⚡

This tells Google to stop trying to index old URLs immediately.

**Steps**:
1. Go to Google Search Console
2. Click **"Removals"** in the left menu (under "Indexing")
3. Click **"New Request"** tab
4. Choose **"Temporarily hide URL"**
5. Select **"Prefix of URL"**
6. Enter: `/artwork/`
7. Click **"Request"**

**What this does**: Tells Google to stop indexing all URLs that start with `/artwork/`

**Timeline**: Takes effect within 24-48 hours

### Option 2: Submit Updated Sitemap (Long-term)

Upload your **current Shopify sitemap** so Google knows what URLs exist now.

**Steps**:
1. Go to Google Search Console
2. Click **"Sitemaps"** in the left menu
3. You should see your current sitemap: `https://repkaarts.com/sitemap.xml`
4. If not listed, add it:
   - Enter: `sitemap.xml`
   - Click "Submit"
5. **Important**: Also submit all individual sitemaps:
   - `sitemap_products_1.xml`
   - `sitemap_collections_1.xml`
   - `sitemap_pages_1.xml`
   - `sitemap_blogs_1.xml` (if you have blogs)

**What this does**: Shows Google all your current valid URLs

**Timeline**: Google will crawl these over the next few days

### Option 3: Create Redirects (Optional - For Link Equity)

If you want to preserve any SEO value from old URLs:

**For artwork URLs you can match**:
1. Create redirects in Shopify:
   - Go to Online Store → Navigation → URL Redirects
   - Add redirect: `/artwork/old-name` → `/products/new-name`
   
**For artwork URLs that don't match**:
- Redirect to homepage: `/artwork/old-name` → `/`
- Or redirect to relevant collection: `/artwork/old-name` → `/collections/all`

## Recommended Action Plan

### Week 1 (Do Now):

1. **Submit URL removal request** for `/artwork/` prefix
   - This stops Google from trying to index them
   - Takes 24-48 hours to take effect

2. **Ensure your sitemap is submitted**
   - Make sure GSC knows about your current Shopify sitemap

### Week 2-4 (Monitor):

3. **Watch your GSC coverage report**
   - You should see 404 errors decrease
   - Old `/artwork/` URLs should stop appearing as errors

4. **Optional: Create redirects for important URLs**
   - If any old artwork pages had backlinks
   - Or if you know which old artworks became which products

### Month 2-3 (Let it resolve naturally):

5. **Let old URLs naturally decay**
   - Google will eventually forget about them
   - Focus on your new Shopify structure

## What About the International URLs?

For URLs like `repkaarts.com/es-int/products/...` returning 404:

These might be:
- Old market configurations that no longer exist
- Incorrectly generated URLs

**Action**:
- Check if these URLs work on your live site
- If they don't work: Let them naturally decay (they'll stop showing as errors over time)
- Or use URL Removal tool to hide them if you're sure they're wrong

## Expected Timeline

| Time | What Happens |
|------|--------------|
| **Day 1** | Submit URL removal request |
| **Week 1** | 404 errors start decreasing |
| **Week 2-4** | Old URLs mostly gone from GSC |
| **Month 2-3** | Coverage report stabilizes |

## Summary

**You don't need to create thousands of redirects.**

Instead:
1. ✅ Use **URL Removal tool** to hide `/artwork/` URLs
2. ✅ Submit your **current Shopify sitemap**
3. ✅ Let Google learn your new structure
4. ✅ Monitor GSC coverage report

This is normal for a website migration. Google just needs time to learn your new structure! 🚀

## Quick Start

**Right now, do this**:
1. Open Google Search Console
2. Go to **Removals** → **New Request**
3. Select **"Prefix of URL"**
4. Enter: `/artwork/`
5. Click **Request**

Done! 🎉
