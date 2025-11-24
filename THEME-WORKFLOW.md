# Shopify Theme Development Workflow

Complete guide for developing and deploying the Repka Arts Shopify theme using a feature branch workflow with dev and live environments.

## 🎯 Overview

This workflow uses a **hybrid development approach** optimized for solo development:

- **Feature branches** → Test locally with instant preview
- **`dev` branch** → Staging environment synced with Dev Theme
- **`main` branch** → Production environment synced with Live Theme

## 🌳 Branch Strategy

```
feature/new-feature  →  dev branch  →  main branch
     (local)         (Dev Theme)      (Live Theme)
```

### Branch Mapping

| Git Branch | Shopify Theme | Theme ID | Purpose |
|------------|---------------|----------|---------|
| `main` | Live Theme | 187671675144 | Production site |
| `dev` | Dev Theme | 190171578632 | Staging/testing |
| `feature/*` | Local only | - | Development |

## 🚀 Daily Development Workflow

### 1. Starting a New Feature

```bash
# Ensure you're on dev branch and up to date
git checkout dev
git pull origin dev

# Create a feature branch
git checkout -b feature/your-feature-name

# Examples:
# git checkout -b feature/new-header
# git checkout -b feature/product-gallery
# git checkout -b feature/fix-mobile-nav
```

### 2. Developing Locally

```bash
# Start local development server
npm run dev

# This opens: http://127.0.0.1:3005
# Connected to your actual Shopify store data
# Changes appear instantly (live reload enabled)
```

**Benefits of local development:**
- ⚡ Instant preview of changes
- 🔄 Live reload on file save
- 🛍️ Real store data (products, collections, etc.)
- 🚫 No conflicts with other work

### 3. Committing Your Work

```bash
# Stage your changes
git add .

# Commit with descriptive message
git commit -m "Add responsive header navigation"

# Push to GitHub (optional, for backup)
git push -u origin feature/your-feature-name
```

### 4. Moving to Staging (Dev Theme)

When your feature is ready for review/testing:

```bash
# Switch to dev branch
git checkout dev

# Merge your feature
git merge feature/your-feature-name

# Push changes to Dev Theme for preview
npm run sync:dev:push
```

**Preview URL:** `https://ipvqw0-j9.myshopify.com/?preview_theme_id=190171578632`

### 5. Testing in Dev Theme

- Test on real devices
- Share preview URL with stakeholders
- Make additional edits if needed:
  - **Option A**: Edit locally on `dev` branch, then `npm run sync:dev:push`
  - **Option B**: Edit in Shopify Theme Editor, then `npm run sync:dev:pull`

### 6. Promoting to Live

When everything is tested and approved:

```bash
# Switch to main branch
git checkout main

# Merge dev into main
git merge dev

# Push to GitHub
git push origin main

# Deploy to Live Theme
npm run sync:live:push
```

**Live URL:** `https://ipvqw0-j9.myshopify.com` (or your custom domain)

## 📝 Common Scenarios

### Scenario A: Quick Fix on Live Site

```bash
# Start from main
git checkout main
git pull origin main

# Create hotfix branch
git checkout -b hotfix/urgent-fix

# Make changes, test locally
npm run dev

# Merge to main
git checkout main
git merge hotfix/urgent-fix

# Deploy to live
npm run sync:live:push

# Also update dev to keep in sync
git checkout dev
git merge main
npm run sync:dev:push
```

### Scenario B: Editing in Shopify Theme Editor (Dev)

```bash
# Make changes in Shopify Theme Editor on Dev Theme
# Then pull those changes to your dev branch:

git checkout dev
npm run sync:dev:pull

# This pulls changes and auto-commits them
# Now push to GitHub
git push origin dev
```

### Scenario C: Pulling Changes from Live Theme

```bash
# If someone edited Live Theme directly
git checkout main
npm run sync:live:pull

# Review changes
git diff HEAD~1

# Push to GitHub
git push origin main

# Update dev to match
git checkout dev
git merge main
npm run sync:dev:push
```

### Scenario D: Multiple Features in Progress

```bash
# Work on feature 1
git checkout -b feature/header
# ... make changes ...
npm run dev  # test locally

# Switch to work on feature 2
git checkout dev
git checkout -b feature/footer
# ... make changes ...
npm run dev  # test locally

# Merge feature 1 when ready
git checkout dev
git merge feature/header
npm run sync:dev:push

# Continue working on feature 2
git checkout feature/footer
```

## 🛠️ Available Commands

### Development

| Command | Description |
|---------|-------------|
| `npm run dev` | Start local dev server on port 3005 |
| `npm run dev:alt` | Start local dev server on port 8080 |
| `npm run dev:local` | Simple HTTP server (no Shopify connection) |

### Sync Commands (New!)

| Command | Description |
|---------|-------------|
| `npm run sync:dev:pull` | Pull from Dev Theme → commit to current branch |
| `npm run sync:dev:push` | Push current branch → Dev Theme |
| `npm run sync:live:pull` | Pull from Live Theme → commit to current branch |
| `npm run sync:live:push` | Push current branch → Live Theme |

### Legacy Commands (Still Work)

| Command | Description |
|---------|-------------|
| `npm run push:dev` | Push to Dev Theme (same as sync:dev:push) |
| `npm run push:live` | Push to Live Theme (same as sync:live:push) |
| `npm run pull` | Pull from Live Theme (no auto-commit) |

## ⚠️ Important Rules

### ✅ DO

- ✅ Always work on feature branches
- ✅ Test locally with `npm run dev` first
- ✅ Merge to `dev` before pushing to Dev Theme
- ✅ Test on Dev Theme before promoting to Live
- ✅ Keep `dev` and `main` in sync
- ✅ Commit frequently with clear messages

### ❌ DON'T

- ❌ Don't push feature branches directly to Dev/Live Theme
- ❌ Don't edit Live Theme directly (use hotfix workflow)
- ❌ Don't merge to `main` without testing on `dev` first
- ❌ Don't forget to pull before starting new work
- ❌ Don't work directly on `main` or `dev` branches (use features)

## 🔗 Important URLs

- **Local Dev Server**: http://127.0.0.1:3005
- **Shopify Admin**: https://ipvqw0-j9.myshopify.com/admin
- **Dev Theme Preview**: https://ipvqw0-j9.myshopify.com/?preview_theme_id=190171578632
- **Dev Theme Editor**: https://ipvqw0-j9.myshopify.com/admin/themes/190171578632/editor
- **Live Theme Editor**: https://ipvqw0-j9.myshopify.com/admin/themes/187671675144/editor
- **GitHub Repository**: https://github.com/growthwebs/repka-arts-website

## 🎨 Theme IDs Reference

```json
{
  "dev_theme": "190171578632",
  "live_theme": "187671675144",
  "store": "ipvqw0-j9.myshopify.com"
}
```

## 🚨 Troubleshooting

### "Working tree not clean" when syncing

```bash
# Commit or stash your changes first
git add .
git commit -m "WIP: describe changes"

# Or stash temporarily
git stash
npm run sync:dev:pull
git stash pop
```

### Local dev server won't start

```bash
# Try alternative port
npm run dev:alt

# Or check if port is in use
lsof -ti:3005 | xargs kill -9
```

### Changes not appearing on Dev Theme

```bash
# Ensure you're on dev branch
git branch

# Push again
npm run sync:dev:push

# Clear browser cache and hard reload
```

### Merge conflicts

```bash
# If conflict occurs during merge
git status  # see conflicted files

# Edit files to resolve conflicts
# Look for <<<<<<< markers

# After resolving
git add .
git commit -m "Resolve merge conflicts"
```

### Need to undo last commit

```bash
# Undo last commit but keep changes
git reset --soft HEAD~1

# Undo last commit and discard changes (careful!)
git reset --hard HEAD~1
```

## 💡 Pro Tips

1. **Commit often**: Small, focused commits are easier to manage and revert if needed

2. **Descriptive branch names**: Use `feature/`, `fix/`, `hotfix/` prefixes
   - `feature/new-checkout-flow`
   - `fix/mobile-menu-overlap`
   - `hotfix/broken-cart-button`

3. **Test locally first**: The local dev server is much faster than pushing to Shopify

4. **Keep dev and main in sync**: Regularly merge `main` into `dev` to avoid drift

5. **Use the Theme Editor wisely**: Great for content changes, but code changes are better done locally

6. **Backup before big changes**: Create a branch before major refactoring

## 📚 Additional Resources

- [Shopify CLI Documentation](https://shopify.dev/docs/themes/tools/cli)
- [Git Branching Guide](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging)
- [Shopify Theme Development](https://shopify.dev/docs/themes)

---

**Need help?** Refer to [DEVELOPMENT.md](./DEVELOPMENT.md) for setup instructions or ask your AI assistant!
