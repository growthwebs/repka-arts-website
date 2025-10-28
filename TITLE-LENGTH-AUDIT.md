# 📏 TITLE LENGTH AUDIT - ALL PAGES
**Character Count Analysis**

## HARDCODED TITLES (From Code):

### ✅ **GOOD (50-60 chars):**
```
Homepage: "Art by Maryna Riepnova | Oil Watercolor Ceramic Málaga" = 56 chars ✅

About: "Maryna Riepnova | Oil Watercolor Ceramic Artist Málaga" = 57 chars ✅

Contact: "Contact Repka Arts | Art Commissions Málaga Spain" = 54 chars ✅

Commission: "Custom Art Commissions | Oil Watercolor Ceramic Prints" = 57 chars ✅

Events: "Art Events Málaga | Paint & Sip Costa del Sol" = 51 chars ✅

Exhibitions: "Art Exhibitions Málaga | Repka Arts Gallery Shows" = 54 chars ✅

Artwork by Medium: "Art by Medium | Oil Watercolor Ceramic Prints Málaga" = 57 chars ✅

Artwork by Series: "Art Collections | Contemporary Paintings Málaga" = 51 chars ✅
```

### ⚠️ **POTENTIALLY TOO LONG:**
```
Shop/Store: "Shop Original Art | Oil Watercolor Ceramic Málaga" = 53 chars ✅

Gallery: "Art Gallery Málaga | Original Paintings & Ceramics" = 54 chars ✅
(Uses & which shows as &amp; - ISSUE!)

Workshops: "Art Workshops Málaga | Painting Classes Costa del Sol" = 58 chars ✅

FAQ: "FAQ | Art Questions & Shipping Info Málaga" = 47 chars ✅
(Uses & which shows as &amp; - ISSUE!)

Privacy: "Privacy Policy | Repka Arts Málaga" = 38 chars → TOO SHORT!

Terms: "Terms & Conditions | Repka Arts Málaga" = 42 chars ✅
(Uses & which shows as &amp; - ISSUE!)

Shipping: "Shipping & Delivery | Worldwide Art Shipping Málaga" = 56 chars ✅
(Uses & which shows as &amp; - ISSUE!)

Refunds: "Returns & Refunds | Repka Arts Policy" = 40 chars → TOO SHORT!
(Uses & which shows as &amp; - ISSUE!)
```

### 🚨 **CRITICAL ISSUES:**

1. **&amp; Problem:** 5+ titles use `&` character
2. **Too Short:** Privacy (38), Refunds (40) 
3. **Dynamic Titles:** Product/Collection titles could be any length!

## ANALYSIS: Why Titles Show `&amp;`

**Current Code (Line 361):**
```liquid
<title>{{ seo_title | escape }}</title>
```

**Problem:** `| escape` converts:
- `&` → `&amp;`
- `<` → `&lt;`
- `>` → `&gt;`

**But:** Browsers automatically handle `&` correctly in `<title>` tags!

**Fix:** Remove `| escape` from title tags (keep for content where needed)



