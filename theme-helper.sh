#!/bin/bash

# Repka Arts Theme Helper Script
# Interactive menu for common theme development tasks

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Theme IDs
DEV_THEME="190171578632"
LIVE_THEME="187671675144"
STORE="ipvqw0-j9.myshopify.com"

# Function to print colored messages
print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

# Function to get current branch
get_current_branch() {
    git branch --show-current
}

# Function to check if working tree is clean
is_working_tree_clean() {
    git diff-index --quiet HEAD --
}

# Function to display status
show_status() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  📊 Repka Arts Theme Status"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    
    CURRENT_BRANCH=$(get_current_branch)
    print_info "Current Branch: $CURRENT_BRANCH"
    
    if is_working_tree_clean; then
        print_success "Working Tree: Clean"
    else
        print_warning "Working Tree: Has uncommitted changes"
    fi
    
    echo ""
    print_info "Dev Theme: $DEV_THEME"
    print_info "Live Theme: $LIVE_THEME"
    print_info "Store: $STORE"
    echo ""
}

# Function to switch branches
switch_branch() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  🌳 Switch Branch"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    
    CURRENT_BRANCH=$(get_current_branch)
    print_info "Current branch: $CURRENT_BRANCH"
    echo ""
    
    echo "Available branches:"
    echo "  1) main (Live Theme)"
    echo "  2) dev (Dev Theme)"
    echo "  3) List all branches"
    echo "  4) Back to main menu"
    echo ""
    read -p "Select option: " choice
    
    case $choice in
        1)
            git checkout main
            print_success "Switched to main branch"
            ;;
        2)
            git checkout dev
            print_success "Switched to dev branch"
            ;;
        3)
            echo ""
            git branch -a
            echo ""
            read -p "Enter branch name to switch to: " branch_name
            git checkout "$branch_name"
            print_success "Switched to $branch_name"
            ;;
        4)
            return
            ;;
        *)
            print_error "Invalid option"
            ;;
    esac
    
    read -p "Press Enter to continue..."
}

# Function to create feature branch
create_feature_branch() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  ✨ Create Feature Branch"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    
    CURRENT_BRANCH=$(get_current_branch)
    
    if [ "$CURRENT_BRANCH" != "dev" ]; then
        print_warning "You're on '$CURRENT_BRANCH'. Feature branches should be created from 'dev'."
        read -p "Switch to dev branch first? (y/n): " switch_choice
        if [ "$switch_choice" = "y" ]; then
            git checkout dev
            git pull origin dev
        else
            return
        fi
    fi
    
    echo ""
    read -p "Enter feature name (e.g., 'new-header'): " feature_name
    
    if [ -z "$feature_name" ]; then
        print_error "Feature name cannot be empty"
        read -p "Press Enter to continue..."
        return
    fi
    
    BRANCH_NAME="feature/$feature_name"
    
    git checkout -b "$BRANCH_NAME"
    print_success "Created and switched to $BRANCH_NAME"
    print_info "Start local dev server with: npm run dev"
    
    read -p "Press Enter to continue..."
}

# Function to sync with Dev Theme
sync_dev_theme() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  🔄 Sync with Dev Theme"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    
    echo "Select sync direction:"
    echo "  1) Pull from Dev Theme → Local"
    echo "  2) Push from Local → Dev Theme"
    echo "  3) Back to main menu"
    echo ""
    read -p "Select option: " choice
    
    case $choice in
        1)
            print_info "Pulling from Dev Theme..."
            npm run sync:dev:pull
            print_success "Sync complete!"
            ;;
        2)
            if ! is_working_tree_clean; then
                print_warning "You have uncommitted changes."
                read -p "Commit changes first? (y/n): " commit_choice
                if [ "$commit_choice" = "y" ]; then
                    git add .
                    read -p "Enter commit message: " commit_msg
                    git commit -m "$commit_msg"
                fi
            fi
            
            print_info "Pushing to Dev Theme..."
            npm run sync:dev:push
            print_success "Sync complete!"
            print_info "Preview at: https://$STORE/?preview_theme_id=$DEV_THEME"
            ;;
        3)
            return
            ;;
        *)
            print_error "Invalid option"
            ;;
    esac
    
    read -p "Press Enter to continue..."
}

# Function to sync with Live Theme
sync_live_theme() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  🚀 Sync with Live Theme"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    
    print_warning "WARNING: This affects the LIVE production site!"
    echo ""
    
    echo "Select sync direction:"
    echo "  1) Pull from Live Theme → Local"
    echo "  2) Push from Local → Live Theme"
    echo "  3) Back to main menu"
    echo ""
    read -p "Select option: " choice
    
    case $choice in
        1)
            print_info "Pulling from Live Theme..."
            npm run sync:live:pull
            print_success "Sync complete!"
            ;;
        2)
            CURRENT_BRANCH=$(get_current_branch)
            if [ "$CURRENT_BRANCH" != "main" ]; then
                print_error "You must be on 'main' branch to push to Live Theme"
                print_info "Current branch: $CURRENT_BRANCH"
                read -p "Press Enter to continue..."
                return
            fi
            
            print_warning "You are about to push to the LIVE theme!"
            read -p "Are you sure? Type 'yes' to confirm: " confirm
            
            if [ "$confirm" = "yes" ]; then
                print_info "Pushing to Live Theme..."
                npm run sync:live:push
                print_success "Sync complete!"
                print_info "Live site: https://$STORE"
            else
                print_info "Cancelled"
            fi
            ;;
        3)
            return
            ;;
        *)
            print_error "Invalid option"
            ;;
    esac
    
    read -p "Press Enter to continue..."
}

# Function to merge branches
merge_branches() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  🔀 Merge Branches"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    
    CURRENT_BRANCH=$(get_current_branch)
    print_info "Current branch: $CURRENT_BRANCH"
    echo ""
    
    echo "Common merge operations:"
    echo "  1) Merge feature → dev"
    echo "  2) Merge dev → main (promote to live)"
    echo "  3) Custom merge"
    echo "  4) Back to main menu"
    echo ""
    read -p "Select option: " choice
    
    case $choice in
        1)
            if [ "$CURRENT_BRANCH" != "dev" ]; then
                git checkout dev
            fi
            
            echo ""
            git branch | grep "feature/"
            echo ""
            read -p "Enter feature branch name to merge: " feature_branch
            
            git merge "$feature_branch"
            print_success "Merged $feature_branch into dev"
            print_info "Next: Push to Dev Theme with 'npm run sync:dev:push'"
            ;;
        2)
            print_warning "This will prepare to deploy to LIVE!"
            read -p "Continue? (y/n): " confirm
            
            if [ "$confirm" = "y" ]; then
                git checkout main
                git merge dev
                print_success "Merged dev into main"
                print_info "Next: Push to Live Theme with 'npm run sync:live:push'"
            fi
            ;;
        3)
            read -p "Enter source branch (to merge from): " source_branch
            read -p "Enter target branch (to merge into): " target_branch
            
            git checkout "$target_branch"
            git merge "$source_branch"
            print_success "Merged $source_branch into $target_branch"
            ;;
        4)
            return
            ;;
        *)
            print_error "Invalid option"
            ;;
    esac
    
    read -p "Press Enter to continue..."
}

# Function to start local dev server
start_dev_server() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  🖥️  Start Local Dev Server"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    
    print_info "Starting Shopify CLI dev server..."
    print_info "Server will be available at: http://127.0.0.1:3005"
    print_info "Press Ctrl+C to stop the server"
    echo ""
    
    npm run dev
}

# Main menu
show_menu() {
    clear
    show_status
    
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  🎨 Repka Arts Theme Helper"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "  1) 🌳 Switch Branch"
    echo "  2) ✨ Create Feature Branch"
    echo "  3) 🔄 Sync with Dev Theme"
    echo "  4) 🚀 Sync with Live Theme"
    echo "  5) 🔀 Merge Branches"
    echo "  6) 🖥️  Start Local Dev Server"
    echo "  7) 📚 View Workflow Documentation"
    echo "  8) ❌ Exit"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
}

# Main loop
while true; do
    show_menu
    read -p "Select option: " option
    
    case $option in
        1) switch_branch ;;
        2) create_feature_branch ;;
        3) sync_dev_theme ;;
        4) sync_live_theme ;;
        5) merge_branches ;;
        6) start_dev_server ;;
        7) 
            if [ -f "THEME-WORKFLOW.md" ]; then
                less THEME-WORKFLOW.md
            else
                print_error "THEME-WORKFLOW.md not found"
                read -p "Press Enter to continue..."
            fi
            ;;
        8)
            echo ""
            print_success "Goodbye! Happy coding! 🎨"
            echo ""
            exit 0
            ;;
        *)
            print_error "Invalid option"
            read -p "Press Enter to continue..."
            ;;
    esac
done
