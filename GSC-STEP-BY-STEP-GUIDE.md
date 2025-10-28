# Google Search Console - Step-by-Step Action Guide

Follow these steps to diagnose and fix your indexing issues.

## Step 1: Access Your Pages Report ⏱️ 2 minutes

1. **Go to Google Search Console**: https://search.google.com/search-console
2. **Select your property**: Click on `repkaarts.com` (or whatever your domain is)
3. **Open Pages**: Click on "Pages" in the left sidebar (under "Indexing" section)
4. **Review the overview**:
   - You'll see a chart showing valid pages vs. issues over time
   - At the bottom, you'll see the issue breakdown

## Step 2: Export the List of 404 Pages ⏱️ 5 minutes

This is your biggest issue (901 pages).

### What to do:

1. In the Pages report, look for the **"Not found (404)"** row
2. **Click on the number** (should say 901 or similar)
3. You'll see a list of URLs that return 404 errors
4. **Click "Export"** button (top right) → Download as CSV or Google Sheets
5. **Save the file** as: `GSC_404_pages.csv`

### What you'll analyze:
- Are these old products that were deleted?
- Are these collection pages with query parameters?
- Are these blog posts that were removed?

## Step 3: Export Redirect Pages ⏱️ 3 minutes

341 pages have redirects.

1. In the Pages report, find **"Page with redirect"** (under Valid section)
2. Click on the number
3. Click **"Export"** → Save as CSV
4. **Save as**: `GSC_redirect_pages.csv`

### What to look for:
- Are these HTTP → HTTPS redirects? (These are normal)
- Do you see multiple redirect chains? (A → B → C)
- Which pages are redirecting?

## Step 4: Export Canonical Duplicate Issues ⏱️ 3 minutes

27 pages have canonical issues.

1. Find **"Duplicate without user-selected canonical"** (under Excluded)
2. Click the number
3. Click **"Export"** → Save as CSV
4. **Save as**: `GSC_canonical_duplicates.csv`

### What to look for:
- Do these URLs have query parameters? (`?sort_by=`, `?page=`, etc.)
- What's the pattern?

## Step 5: Export Noindex Pages ⏱️ 2 minutes

46 pages are blocked by noindex.

1. Find **"Excluded by 'noindex' tag"** (under Excluded)
2. Click the number → Export
3. **Save as**: `GSC_noindex_pages.csv`

### What to check:
- Are these system pages? (cart, checkout, search results)
- Any important pages that shouldn't be blocked?

## Step 6: Export "Crawled Not Indexed" Pages ⏱️ 3 minutes

137 pages were crawled but not indexed.

1. Under Excluded, find **"Crawled - currently not indexed"**
2. Click the number → Export
3. **Save as**: `GSC_crawled_not_indexed.csv`

### What to analyze:
- Are these low-content pages?
- Do they have good unique content?

## Step 7: Create Your Analysis Spreadsheet ⏱️ 10 minutes

Create a new Google Sheet or Excel file to organize your findings.

### Create these columns:

**Sheet 1: "404 Analysis"**
- Column A: URL
- Column B: Type (Product/Collection/Blog/Other)
- Column C: Status (Keep/Redirect/Remove)
- Column D: Action Required (what to do)
- Column E: Priority (High/Medium/Low)
- Column F: Notes

**Sheet 2: "Redirect Analysis"**
- Column A: Original URL
- Column B: Redirects to
- Column C: Chain length (1, 2, 3+ redirects)
- Column D: Type (HTTP→HTTPS, Product→Collection, etc.)
- Column E: Action Required

**Sheet 3: "Canonical Issues"**
- Column A: Page URL
- Column B: Has parameters? (Yes/No)
- Column C: Parameter type (sort_by, filter, etc.)
- Column D: Action Required

**Sheet 4: "Action Items"**
- Column A: Issue
- Column B: Priority
- Column C: Action
- Column D: Status
- Column E: Due Date

## Step 8: Quick Analysis - What to Look For ⏱️ 15 minutes

### For 404 Pages:
1. **Look for patterns**:
   ```
   Are many URLs like this?
   - /collections/painting?sort_by=price
   - /products/old-artwork-123
   - /blogs/news/old-post
   ```

2. **Categorize them**:
   - Old products (discontinued)
   - Query parameter URLs (bad URLs)
   - Blog posts that were deleted
   - Broken internal links

3. **Decide what to do**:
   - **Old products**: Can ignore or submit removal request in GSC
   - **Query parameter URLs**: This is why you need canonical tags (already have them)
   - **Broken internal links**: Fix the links on your site
   - **Valid 404s**: Nothing - let them naturally decay

### For Redirect Chains:
1. **Check if they're normal**:
   - HTTP → HTTPS is normal and fine
   - Product → Product redirect might be old products merged

2. **If you see chains like**: A → B → C
   - Find where A originally links
   - Change it to point to C directly

### For Canonical Issues:
1. **Check if URLs have parameters**:
   ```
   Bad: /collections/art?sort_by=price&page=2
   Good: /collections/art (canonical should be this)
   ```

2. **If many have parameters**: Your canonical tags should handle this (they already do)

## Step 9: Prioritize Your Fixes ⏱️ 10 minutes

Based on your analysis, create a priority list:

### High Priority (Do first):
1. Fix any broken internal links pointing to 404 pages
2. Add redirects for important old URLs that have backlinks
3. Review and fix any canonical issues on important pages

### Medium Priority:
1. Submit removal requests for old 404 pages with no backlinks
2. Optimize the 137 pages that are crawled but not indexed (add content)

### Low Priority (Monitor):
1. Let old 404s naturally decay
2. Most redirects are probably fine (HTTP→HTTPS)

## Step 10: Take Action - Fix the Most Critical Issues ⏱️ 30+ minutes

### If you found broken internal links:
1. Go to your Shopify admin
2. Find the pages with broken links
3. Update them to point to correct URLs

### If you need to add redirects:
1. Go to Shopify Admin → Online Store → Navigation
2. Or create redirects in bulk using apps or CSV

### If you need to improve content:
1. Go through the "crawled not indexed" pages
2. Add more content, images, descriptions
3. Make each page unique and valuable

## Step 11: Request Re-indexing (After making changes) ⏱️ 2 minutes

1. In GSC, go to **URL Inspection** tool (left sidebar)
2. Enter the URLs you fixed
3. Click **"Request Indexing"**
4. Do this for important pages you've changed

## Step 12: Monitor Progress ⏱️ 5 minutes/week

1. **Set a weekly reminder** to check GSC Coverage report
2. **Track improvements**:
   - Are 404 errors decreasing?
   - Are redirect chains improving?
   - Are more pages getting indexed?

3. **Document changes** in your spreadsheet

## Quick Reference: Expected Timeline

- **Week 1**: Fix critical issues (broken links, important redirects)
- **Week 2-3**: Request reindexing, monitor changes
- **Week 4-6**: See significant improvements in coverage

## Next Steps After This Guide

1. ✅ **Do Steps 1-6 now**: Export all the data
2. ✅ **Do Step 7**: Create your analysis spreadsheet
3. ✅ **Do Step 8**: Quick analysis to understand the issues
4. ⏳ **Do Step 9**: Prioritize what to fix
5. ⏳ **Do Step 10**: Take action on high-priority items
6. ⏳ **Do Step 11**: Request reindexing
7. ⏳ **Do Step 12**: Monitor weekly

## Need Help?

If you're stuck on any step or find patterns you don't understand:
1. Take a screenshot of the issue
2. Note which step you're on
3. Share your findings and I'll help you interpret them

## Summary Checklist

- [ ] Exported 404 pages CSV
- [ ] Exported redirect pages CSV
- [ ] Exported canonical duplicates CSV
- [ ] Exported noindex pages CSV
- [ ] Exported crawled-not-indexed CSV
- [ ] Created analysis spreadsheet
- [ ] Analyzed patterns in the data
- [ ] Created priority action list
- [ ] Fixed high-priority issues
- [ ] Requested reindexing
- [ ] Set weekly monitoring reminder

Good luck! 🚀
