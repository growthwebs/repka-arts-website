# GSC 404 Error Analysis - 901 Pages

## Timeline of 404 Errors

From the Chart data:
- **July 29 - October 11**: Stable at 73-110 pages
- **October 12-14**: Jumped to 285 pages
- **October 19-20**: Jumped to 636 pages  
- **October 22-25**: Reached **901 pages** (current)

This confirms the spike happened on **October 12-15**!

## Categories of 404 Errors

After analyzing the 901 URLs, here are the patterns:

### 1. **Multi-Language Product URLs** (≈70%)
**Pattern**: `https://repkaarts.com/{lang}-{region}/products/{product-name}`

Examples:
- `https://repkaarts.com/es-int/products/lilies-art-print?variant=52514401485064`
- `https://repkaarts.com/en-es/products/serenity-in-bloom-n3`
- `https://repkaarts.com/fr-eu/products/ostriches`

**Issue**: These are **internationalized product URLs** with language/region codes (`en-es`, `fr-int`, `es-eu`) that probably shouldn't exist or are generating 404s.

**Question**: Do you have international/language variants configured in Shopify? If yes, are they supposed to be indexed?

### 2. **Old Website Structure URLs** (≈20%)
**Pattern**: `https://www.repkaarts.com/artwork/{artwork-name}`

Examples:
- `https://www.repkaarts.com/artwork/mountain-shimmer-oil-painting`
- `https://www.repkaarts.com/artwork/undulating-forms`
- `https://www.repkaarts.com/artwork/calle-cabello-malaga-watercolour`

**Issue**: These look like an **old website structure** using `/artwork/` URLs. You may have migrated to a new structure (Shopify products).

### 3. **Old Legacy Pages** (≈5%)
Examples:
- `https://www.repkaarts.com/art/sold-works`
- `https://www.repkaarts.com/art/ceramics`
- `https://www.repkaarts.com/series/savannah-vibes`
- `https://www.repkaarts.com/resources`
- `https://www.repkaarts.com/about`

**Issue**: Old website pages that may have been restructured or removed.

### 4. **System/Error URLs** (≈2%)
Examples:
- `https://www.repkaarts.com/_serverless/pro-gallery-native-layout-fixer/...`
- `https://repkaarts.com/${t}`
- `https://repkaarts.com/b`

**Issue**: These are system/debug URLs that shouldn't be crawled.

### 5. **Event Pages** (≈2%)
Examples:
- `https://www.repkaarts.com/event-details/art-workshops-at-ruta-del-arte-frigiliana`
- `https://www.repkaarts.com/event-details/lets-paint-together-with-repka-arts`

**Issue**: Event pages that may have expired or were removed.

### 6. **Country-Specific Pages** (≈1%)
Examples:
- `https://www.repkaarts.com/buy-art-in/sweden`
- `https://www.repkaarts.com/buy-art-in/finland`

**Issue**: Geographic routing pages that may have been removed.

## Root Cause Analysis

### What Likely Happened on October 12-15:

1. **Major website migration/restructure**:
   - You moved from an old structure (`/artwork/`, `/art/`, `/series/`) to Shopify products
   - Old URLs are now 404ing

2. **Internationalization changes**:
   - If you added or changed language/region routing
   - Created many duplicate product URLs in different locales
   - These may be incorrectly configured

3. **Sitemap resubmission**:
   - Google discovered lots of new URLs via sitemap
   - Many of these are returning 404s

## Recommendations

### HIGH PRIORITY (Do This Week):

#### 1. Fix International URL Structure
**Problem**: URLs like `repkaarts.com/es-int/products/` are 404ing.

**Solution Options**:
- **Option A**: If you don't need international variants, disable them in Shopify
  - Shopify Admin → Online Store → Preferences
  - Check your market/language settings
  - Remove any markets or languages you don't need

- **Option B**: If you DO need international variants, fix the URL structure
  - Ensure each locale actually has content
  - Don't create product variants for every language if they don't exist

#### 2. Set Up Redirects for Old URLs
**Problem**: Old `/artwork/` and other legacy URLs are 404ing.

**Solution**: 
- Use Shopify's URL Redirects feature
- Bulk redirect old structure to new structure
- Example: `/artwork/serenity-in-bloom-n1` → `/products/serenity-in-bloom-n1`

**How to bulk redirect**:
1. Download all old artwork URLs from your legacy site
2. Export current Shopify product URLs
3. Match them up
4. Import into Shopify redirects

#### 3. Remove System URLs from Sitemap
**Problem**: System URLs like `/_serverless/` are being crawled.

**Solution**:
- Update your robots.txt to block these paths
- Or ensure your sitemap doesn't include them

### MEDIUM PRIORITY (This Month):

#### 4. Fix Geographic Pages
If you removed country-specific pages, either:
- Redirect them to homepage or category pages
- Or submit removal requests in GSC

#### 5. Fix Event Pages
If events expired:
- Either keep them for historical purposes (and make them return 200)
- Or redirect to a current events page
- Or submit removal requests in GSC

### LOW PRIORITY (Monitor):

#### 6. Let Some 404s Naturally Decay
If these are from:
- External sites linking to old content
- Google's internal linking discovery
- Historical crawls

**Action**: Just let them naturally decay over time as Google re-crawls.

## Specific Actions for Each Category

### For Multi-Language URLs:
1. **Check your Shopify markets**: Are you supposed to have `es-int`, `en-es`, `fr-eu`, etc.?
2. **If not needed**: Disable these markets in Shopify Admin
3. **If needed**: Ensure each market actually has content published

### For Old `/artwork/` URLs:
1. **Determine what the new equivalent is**:
   - Is it a product now? → Redirect to `/products/{name}`
   - Is it a collection? → Redirect to `/collections/{name}`
2. **Create bulk redirects** in Shopify Admin → Online Store → Navigation → URL Redirects

### For System URLs:
1. **Add to robots.txt**:
   ```
   Disallow: /_serverless/
   Disallow: /_api/
   ```
2. **Or** remove them from your sitemap

## Expected Results After Fixes

After implementing these fixes:
- **Week 1-2**: 404 errors may increase slightly as Google re-crawls
- **Week 3-4**: Start seeing decline in 404 errors
- **Week 4-6**: Should see significant reduction (target: <400 from 901)

## Next Steps - Action Plan

### Immediate (Today):
1. ✅ Download completed: You have the 901 URLs analyzed
2. ⏳ **Review your Shopify markets/languages**: Check if international variants are configured
3. ⏳ **Check your current URL structure**: What do valid products look like now?

### This Week:
1. **Create redirect mapping**: Old URLs → New URLs
2. **Bulk import redirects** into Shopify
3. **Fix internationalization settings** (if needed)

### Monitoring:
1. **Check GSC weekly** for improvement in 404 count
2. **Track which URLs get resolved** vs. which stay 404
3. **Submit removal requests** for URLs that can't be redirected

## Questions to Answer

1. **Do you have international/multi-language variants configured in Shopify?**
   - If yes, do they each have unique content?
   - If no, why are these URLs being generated?

2. **What is your current URL structure for products?**
   - Is it `/products/` or something else?
   - Do you have a mapping of old URLs to new URLs?

3. **When did you migrate to Shopify?**
   - Was October 12-15 when you launched the new site?
   - Or when did you restructure URLs?

4. **Do you have a redirect plan?**
   - Can you export old URLs from your previous website?
   - Do you know which old URLs map to which new URLs?

Let me know the answers to these, and I can help you create the specific redirect mapping and fixes! 🚀
