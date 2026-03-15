#!/bin/bash

# Deployment Script for StrataFair

set -e

# Color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to log messages
log() {
    echo -e "${GREEN}[DEPLOY]${NC} $1"
}

# Function to log warnings
warn() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Validate environment
validate_env() {
    log "Validating environment..."
    
    # Check Node.js
    if ! command -v node &> /dev/null; then
        warn "Node.js is not installed. Please install Node.js 18.x"
        exit 1
    fi

    # Check npm
    if ! command -v npm &> /dev/null; then
        warn "npm is not installed. Please install npm"
        exit 1
    fi

    # Check Cloudflare Wrangler
    if ! command -v wrangler &> /dev/null; then
        warn "Cloudflare Wrangler is not installed. Installing..."
        npm install -g wrangler
    fi
}

# Build frontend
build_frontend() {
    log "Building frontend..."
    cd frontend
    npm install
    npm run build
}

# Deploy to Cloudflare Pages
deploy_cloudflare() {
    log "Deploying to Cloudflare Pages..."
    wrangler pages deploy build --project-name=stratafair
}

# Main deployment function
main() {
    log "Starting StrataFair deployment..."
    
    validate_env
    build_frontend
    deploy_cloudflare

    log "Deployment completed successfully! 🚀"
    echo -e "\n${GREEN}Access your site at: https://stratafair.pages.dev${NC}"
}

# Run the deployment
main