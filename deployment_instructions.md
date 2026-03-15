# StrataFair Deployment Instructions

## GitHub Repository Setup

1. Create Repository
```bash
gh repo create stratafair --public
```

2. Set up GitHub Secrets in Repository Settings
- `API_BASE_URL`: https://corpmini-backend.onrender.com/api
- `CLOUDFLARE_API_TOKEN`: [Your Cloudflare API Token]
- `CLOUDFLARE_ACCOUNT_ID`: [Your Cloudflare Account ID]

## Manual Deployment Steps

### Local Setup
```bash
git clone https://github.com/Ken-Rest/stratafair.git
cd stratafair/frontend
npm install
npm run build
```

### Cloudflare Pages Deployment
```bash
# Install Wrangler CLI
npm install -g wrangler

# Login to Cloudflare
wrangler login

# Deploy to Cloudflare Pages
wrangler pages deploy frontend/build --project-name=stratafair
```

## Production Credentials
- Frontend URL: https://stratafair.pages.dev
- Backend API: https://corpmini-backend.onrender.com/api

### Default Login
- Email: ken@handyproperty.com.au
- Password: SecurePass123!

## Troubleshooting
- Ensure API_BASE_URL is correctly set
- Check Cloudflare API token permissions
- Verify GitHub Actions workflow configuration