---
created: 2025-10-14
tags: [doc, cnp, payjim, feature]
project: PayJIM
status: in-progress
---

# PayJIM Architecture

PayJIM is the international/USD version of InfinitePay's payment link system, designed for US market operations with JIM branding.

## Project Overview

**Goal**: Enable USD-based payment processing with JIM branding for international customers

**Repository**: [[CNP Monorepo Overview]] - infinitepay-cnp-monorepo

## Key Differences from InfinitePay

### Currency & Localization
- **Currency**: USD instead of BRL
- **Phone Numbers**: +1 (US) DDI instead of +55 (Brazil)
- **Tax IDs**: No CPF/CNPJ required (US market)
- **Address Lookup**: Custom fields instead of ViaCEP (Brazil-specific)

### Branding
- **Logo**: JIM branding instead of InfinitePay
- **Theme**: Dark theme enforced
- **Footer**: Custom terms and conditions links
- **Card Brands**: US-focused card brand selection
- **Avatar**: Custom default avatar

### Payment Features
- **Installments**: Removed (not common in US market)
- **SMS Preference**: SMS-first approach (Whats optional)
- **Language**: English for SMS/WhatsApp notifications
- **Wallets**: Apple Pay and Google Pay with USD

### URL Structure
- Domain: `pay.jim.com`
- Format supports decimal notation: `VCD-10.00` (not `10,00`)
- No fallback pattern like `pay.jim/com/10.00`

## Technical Components

### Frontend Changes (CNP Monorepo)

#### Tela Inicial (Home Screen)
- Updated card brand logos
- Currency display (USD)
- JIM logo integration
- Updated footer links

#### Tela Pagamento (Payment Screen)
- USD currency throughout
- US phone number validation (+1 DDI)
- Updated card brands
- SMS-first notification
- English language support
- Removed installment options (wallet & credit)
- Address collection without ViaCEP
- No CPF/CNPJ fields

#### Wallets Integration
- Apple Pay USD support
- Google Pay USD support

### Backend Changes

#### API Services
- USD notation support
- Product ID: 1 (JIM-specific)
- Tenant ID handling for shoppers
- Invoice API tenant_id integration

#### Authentication & Authorization
- Link-API impersonation for JIM users in PROD
- User segregation: InfinitePay users should get 404 on JIM links

### Infrastructure & Configuration

#### Observability
- **Sentry**: Dedicated project for PayJIM - [Link](https://cloudwalk-inc.sentry.io/issues/?project=4510108586606592)
- **Rudderstack**: Created and referenced in secrets, needs Amplitude connection
- **Clarity**: Pending setup (contact: Shazam)
- **Console Errors**: CSP-related issues to investigate

#### Risk & Compliance
- Severine configuration for JIM transactions in PROD
- Custom merchant anticipation percentages

#### Onboarding
- Product ID = 1
- Tenant ID configuration
- Shopper management

## Data Flow

```
Customer → pay.jim.com/[payment-link]
  ↓
CNP Frontend (USD, JIM branding)
  ↓
Payment Method Selection
  ↓
API v2 (tenant-aware, USD processing)
  ↓
Payment Processing (Severine)
  ↓
Receipt (custom JIM receipt, not InfinitePay redirect)
```

## Outstanding Questions

- [ ] Shopper tenant_id = 2 configuration?
- [ ] Invoice-API tenant_id scope (all entities or just main ones?) - **Ask Alberto**
- [ ] Backend listen implementation status
- [ ] Link product=1 usage verification

## Integration Points

### Related Services
- [[InfinitePay API v2]] - Backend processing
- [[infinitepay-receipt-js]] - Custom receipt display (not redirect)
- SMS/WhatsApp service - English language support
- Address validation - Custom implementation without ViaCEP

### Team Contacts
- **Rafa Vieira**: SMS/WhatsApp English implementation
- **Shazam**: Clarity setup
- **Alberto**: tenant_id architecture discussion
- **Marcus**: Address handling, CPF removal, user blocking
- **João**: Backend USD support, domain configuration

## Recent PRs

### Merged
- [#725](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/725) - USD currency conversion
- [#724](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/724) - Footer/terms links
- [#729](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/729) - Remove installments
- [#726](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/726) - +1 DDI support
- [#732](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/732) - SMS-first preference
- [#730](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/730) - URL decimal notation

### In Review
- [#738](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/738) - Force dark theme
- [#735](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/735) - Wallet USD support
- [#737](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/737) - Remove CPF/CNPJ
- [#740](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/740) - InfinitePay user 404
- [infinitepay-api-v2#7157](https://github.com/cloudwalk/infinitepay-api-v2/pull/7157) - API user blocking

## Related Notes

- [[PayJIM - Atividades]] - Detailed task tracking
- [[CNP Monorepo Overview]]
- [[InfinitePay API v2]]

---

## TODO
- [ ] Create architecture diagram
- [ ] Document tenant ID strategy after discussion with Alberto
- [ ] Verify final receipt flow design
- [ ] Document monitoring/alerting setup
- [ ] Create runbook for PayJIM-specific operations
