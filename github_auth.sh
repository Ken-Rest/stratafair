#!/bin/bash

# GitHub Authentication and Secret Setup Script

# Cloudflare Configuration
CLOUDFLARE_API_TOKEN=sk-5Ry9yWPnWtjfRIEbj3tdzBtP4cOGz4qw0QYOO
CLOUDFLARE_ACCOUNT_ID=7927cc28dc707f32ef6d1f2189647682
API_BASE_URL=https://corpmini-backend.onrender.com/api

# Authenticate GitHub
gh auth login

# Set GitHub Secrets
gh secret set API_BASE_URL "$API_BASE_URL"
gh secret set CLOUDFLARE_API_TOKEN "$CLOUDFLARE_API_TOKEN"
gh secret set CLOUDFLARE_ACCOUNT_ID "$CLOUDFLARE_ACCOUNT_ID"

echo "Secrets successfully configured!"