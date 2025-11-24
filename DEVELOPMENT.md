# Repka Arts Theme Development Guide

> **📚 For the complete development workflow**, see [THEME-WORKFLOW.md](./THEME-WORKFLOW.md)
> 
> This guide covers local development setup. For feature branches, staging, and deployment workflow, refer to the workflow documentation.

## 🎨 Local Development Environment

This guide explains how to work on the Repka Arts Shopify theme locally with full development capabilities.

## 🚀 Quick Start

### Option 1: Custom Development Server (Recommended)
```bash
# Start local development server
python3 start-dev.py

# Or specify a custom port
python3 start-dev.py 8081
```

### Option 2: Simple HTTP Server
```bash
# Basic file serving
python3 -m http.server 8080
```

### Option 3: Interactive Development Menu
```bash
# Run interactive development script
./dev-server.sh
```

## 🔧 Development Workflow

### 1. Local Development
```bash
# Start local server
python3 start-dev.py

# Make changes to theme files
# Files are served immediately
# Visit http://localhost:8080 to preview
```

### 2. Version Control
```bash
# Commit your changes
git add .
git commit -m "Description of changes"

# Push to GitHub
git push origin main
```

### 3. Deploy to Shopify
```bash
# Push to development theme
shopify theme push --theme=190171578632 --development

# Or push to live theme
shopify theme push --theme=187671675144 --live
```

## 📁 Project Structure

```
repka-arts/
├── templates/          # Page templates
├── sections/           # Reusable sections
├── snippets/           # Reusable code snippets
├── assets/             # CSS, JS, images
├── config/             # Theme settings
├── locales/            # Translations
├── layout/             # Layout templates
└── blocks/             # Custom blocks
```

## 🎯 Available Scripts

```bash
# Development
npm run dev              # Shopify CLI dev server
npm run dev:alt          # Alternative port
npm run dev:local        # Simple HTTP server

# Deployment
npm run push:dev         # Push to development theme
npm run push:live        # Push to live theme
npm run deploy           # Build and deploy to live

# Sync
npm run pull             # Pull from Shopify
npm run sync             # Pull, commit, and push to GitHub
```

## 🔗 Important URLs

- **Local Development**: http://localhost:8080
- **Shopify Store**: https://ipvqw0-j9.myshopify.com
- **GitHub Repository**: https://github.com/growthwebs/repka-arts-website
- **Theme Editor**: https://ipvqw0-j9.myshopify.com/admin/themes/187671675144/editor

## 🎨 Theme IDs

- **Development Theme**: 190171578632
- **Live Theme**: 187671675144

## 💡 Development Tips

1. **Use local server** for rapid iteration
2. **Commit frequently** to GitHub
3. **Test on Shopify** before going live
4. **Use development theme** for testing
5. **Sync regularly** between local and Shopify

## 🚨 Troubleshooting

### Shopify CLI Issues
If `shopify theme dev` fails with network errors:
```bash
# Use custom development server
python3 start-dev.py
```

### Port Conflicts
```bash
# Use different port
python3 start-dev.py 8081
```

### File Changes Not Reflecting
- Restart the development server
- Clear browser cache
- Check file paths and syntax
