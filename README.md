# StrataFair - Strata Management Platform

## Overview
StrataFair is a comprehensive strata management solution designed for small to medium-sized buildings, providing seamless property management, communication, and financial tracking.

## Features
- 📋 Owner Management
- 💰 Body Corporate Fee Tracking
- 🔧 Maintenance Request System
- 📄 Document Management
- 📊 Reporting and Analytics

## Technology Stack
- Frontend: React TypeScript
- UI Library: Material-UI
- State Management: React Hooks
- Routing: React Router
- Deployment: Cloudflare Pages
- Backend: Node.js Express

## Getting Started

### Prerequisites
- Node.js 18.x
- npm 9.x

### Local Development
1. Clone the repository
2. Navigate to frontend directory
3. Install dependencies
```bash
cd frontend
npm install
npm start
```

### Environment Configuration
Create a `.env.local` file in the frontend directory:
```
REACT_APP_API_BASE_URL=https://your-backend-url.com/api
```

## Deployment
Automatically deployed via GitHub Actions to Cloudflare Pages

## Security
- JWT Authentication
- Role-based Access Control
- HTTPS Enforcement
- Content Security Policies

## License
Proprietary - Handy Services Pty Ltd