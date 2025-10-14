---
created: 2025-10-14
tags: [doc, cnp, learning]
repository: infinitepay-cnp-monorepo
link: https://github.com/cloudwalk/infinitepay-cnp-monorepo
---

# CNP Monorepo Overview

The **infinitepay-cnp-monorepo** is the main repository for Card Not Present (CNP) payment functionality at InfinitePay/Cloudwalk.

## Repository Information

- **URL**: https://github.com/cloudwalk/infinitepay-cnp-monorepo
- **Purpose**: Card Not Present payment processing, payment links, and related frontend components
- **Type**: Monorepo

## Key Components

### Payment Links
- Payment link generation and processing
- Invoice management
- Multiple payment methods support

### Payment Screens
- **Tela Inicial (Home Screen)**: Initial payment interface
- **Tela Pagamento (Payment Screen)**: Main payment processing interface
- Payment method selection (credit, wallet, Apple Pay, Google Pay)

### Supported Features
- Multiple currencies (BRL, USD)
- Card brand detection and validation
- SMS/WhatsApp payment notifications
- Terms and conditions links
- Custom branding (logos, footers)
- Dark/light theme support

## Technology Stack

_(Add details as you work with the codebase)_

- Frontend framework:
- Backend services:
- Payment processors:
- Observability: Sentry, Rudderstack, Clarity

## Related Projects

- [[PayJIM Architecture]] - USD payment implementation for JIM
- [[InfinitePay API v2]] - Backend API services
- [[infinitepay-dashboard-js]] - Dashboard integration
- [[infinitepay-receipt-js]] - Receipt generation

## Key Integrations

- **Sentry**: Error tracking and monitoring
- **Rudderstack**: Analytics and event tracking
- **Amplitude**: Product analytics
- **Clarity**: User session recording
- **ViaCEP**: Address lookup (being replaced for international support)

## Development Workflow

### Common Tasks
- Payment screen customization
- Currency localization
- Payment method configuration
- Branding updates
- Terms and conditions management

### Recent Major Changes
- USD support implementation
- International phone number support (+1 DDI)
- Wallet payment options
- SMS-first notification strategy

## Notes

- Monorepo structure allows shared components across payment flows
- Active development for PayJIM (USD/international support)
- Backend listen functionality being implemented

## Related Work Notes

- [[PayJIM - Atividades]]

---

## TODO
- [ ] Document monorepo structure in detail
- [ ] Add technology stack specifics
- [ ] Create architecture diagram
- [ ] Document deployment process
