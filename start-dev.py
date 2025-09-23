#!/usr/bin/env python3
"""
Repka Arts Theme Development Server
Custom local development environment for Shopify theme development
"""

import http.server
import socketserver
import os
import sys
import json
import webbrowser
from pathlib import Path

class ThemeDevHandler(http.server.SimpleHTTPRequestHandler):
    """Custom handler for theme development"""
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(Path(__file__).parent), **kwargs)
    
    def end_headers(self):
        # Add CORS headers for development
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        super().end_headers()
    
    def do_GET(self):
        # Serve theme files
        if self.path == '/':
            # Check if index.html exists, otherwise serve development index
            if os.path.exists(os.path.join(self.directory, 'index.html')):
                self.path = '/index.html'
            else:
                self.path = '/templates/index.liquid'
        
        # Handle Liquid files - serve as HTML for development
        if self.path.endswith('.liquid'):
            # For development, we'll serve liquid files as plain text
            # In production, Shopify processes these
            pass
        
        return super().do_GET()

def load_dev_config():
    """Load development configuration"""
    config_file = Path(__file__).parent / 'dev-config.json'
    if config_file.exists():
        with open(config_file, 'r') as f:
            return json.load(f)
    return {}

def start_dev_server(port=8080):
    """Start the development server"""
    config = load_dev_config()
    port = config.get('shopify', {}).get('port', port)
    
    print("🎨 Repka Arts Theme Development Server")
    print("=====================================")
    print(f"📁 Directory: {Path(__file__).parent}")
    print(f"🌐 Port: {port}")
    print(f"🔗 URL: http://localhost:{port}")
    print("")
    print("📝 Available endpoints:")
    print(f"   • Homepage: http://localhost:{port}/")
    print(f"   • Templates: http://localhost:{port}/templates/")
    print(f"   • Sections: http://localhost:{port}/sections/")
    print(f"   • Assets: http://localhost:{port}/assets/")
    print("")
    print("🚀 Starting server... (Press Ctrl+C to stop)")
    print("")
    
    try:
        with socketserver.TCPServer(("", port), ThemeDevHandler) as httpd:
            # Open browser automatically
            webbrowser.open(f'http://localhost:{port}')
            httpd.serve_forever()
    except KeyboardInterrupt:
        print("\n👋 Development server stopped.")
    except OSError as e:
        if e.errno == 48:  # Address already in use
            print(f"❌ Port {port} is already in use. Try a different port.")
            print("💡 You can specify a different port: python3 start-dev.py 8081")
        else:
            print(f"❌ Error starting server: {e}")

if __name__ == "__main__":
    port = 8080
    if len(sys.argv) > 1:
        try:
            port = int(sys.argv[1])
        except ValueError:
            print("❌ Invalid port number. Using default port 8080.")
    
    start_dev_server(port)
