#!/bin/bash

# Final Deployment Script for StrataFair

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() {
    echo -e "${GREEN}[DEPLOY]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Validate tools
validate_tools() {
    log "Validating deployment tools..."
    command -v gh >/dev/null 2>&1 || { warn "GitHub CLI not installed. Installing..."; brew install gh; }
    command -v wrangler >/dev/null 2>&1 || { warn "Cloudflare Wrangler not installed. Installing..."; npm install -g wrangler; }
}

# Set up GitHub repository
setup_github() {
    log "Setting up GitHub repository..."
    cd ~/projects/stratafair
    
    # Ensure git is initialized
    git init
    
    # Add all files
    git add .
    
    # Commit changes
    git commit -m "Final deployment preparation" || true
    
    # Try to create repo, ignore if exists
    gh repo create stratafair --public --source=. --remote=origin || true
    
    # Force push to ensure latest code
    git push -u origin main --force
}

# Configure deployment secrets
configure_secrets() {
    log "Configuring GitHub Secrets..."
    gh secret set API_BASE_URL https://corpmini-backend.onrender.com/api || true
    gh secret set CLOUDFLARE_API_TOKEN sk-5Ry9yWPnWtjfRIEbj3tdzBtP4cOGz4qw0QYOO || true
    gh secret set CLOUDFLARE_ACCOUNT_ID 7927cc28dc707f32ef6d1f2189647682 || true
}

# Deploy frontend
deploy_frontend() {
    log "Deploying frontend..."
    cd ~/projects/stratafair/frontend
    npm install
    npm run build
    wrangler pages deploy build --project-name=stratafair
}

# Main deployment function
main() {
    validate_tools
    setup_github
    configure_secrets
    deploy_frontend
    
    log "🚀 Deployment COMPLETE!"
    echo -e "\n${GREEN}Access your site at: https://stratafair.pages.dev${NC}"
}

# Run the deployment
main