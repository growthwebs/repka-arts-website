#!/bin/bash

# Repka Arts Theme Development Server
# This script provides multiple options for local development

echo "🎨 Repka Arts Theme Development Server"
echo "======================================"

# Function to start Shopify CLI dev server
start_shopify_dev() {
    echo "🚀 Starting Shopify CLI development server..."
    echo "Port: 3005"
    echo "Theme ID: 190171578632 (Development)"
    echo ""
    shopify theme dev --theme=190171578632 --port=3005 --live-reload
}

# Function to start alternative Shopify CLI dev server
start_shopify_dev_alt() {
    echo "🚀 Starting Shopify CLI development server (Alternative)..."
    echo "Port: 8080"
    echo "Theme ID: 190171578632 (Development)"
    echo ""
    shopify theme dev --theme=190171578632 --port=8080 --live-reload
}

# Function to start simple HTTP server
start_simple_server() {
    echo "🌐 Starting simple HTTP server..."
    echo "Port: 8080"
    echo "Directory: $(pwd)"
    echo ""
    python3 -m http.server 8080
}

# Function to show development options
show_options() {
    echo "Available development options:"
    echo "1) Shopify CLI Dev Server (Port 3005)"
    echo "2) Shopify CLI Dev Server (Port 8080)"
    echo "3) Simple HTTP Server (Port 8080)"
    echo "4) Push to Development Theme"
    echo "5) Pull from Live Theme"
    echo "6) Exit"
    echo ""
    read -p "Choose an option (1-6): " choice
    
    case $choice in
        1) start_shopify_dev ;;
        2) start_shopify_dev_alt ;;
        3) start_simple_server ;;
        4) shopify theme push --theme=190171578632 --development ;;
        5) shopify theme pull --theme=187671675144 ;;
        6) echo "👋 Goodbye!"; exit 0 ;;
        *) echo "❌ Invalid option. Please choose 1-6."; show_options ;;
    esac
}

# Main execution
show_options
