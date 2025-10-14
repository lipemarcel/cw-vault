---
created: 2025-10-14
tags: [doc, learning, cnp]
repository: infinitepay-api-v2
link: https://github.com/cloudwalk/infinitepay-api-v2
---

# InfinitePay API v2

Backend API service for InfinitePay payment processing, user management, and business logic.

## Repository Information

- **URL**: https://github.com/cloudwalk/infinitepay-api-v2
- **Purpose**: Core backend API for InfinitePay platform
- **Type**: API Service

## Overview

InfinitePay API v2 is the primary backend service that handles:
- Payment processing
- User authentication and authorization
- Merchant/shopper management
- Invoice generation and handling
- Transaction management
- Multi-tenancy support

## Key Features

### Multi-Tenancy
- Tenant ID-based data segregation
- Support for multiple products/brands (InfinitePay, JIM, etc.)
- Shopper and merchant isolation by tenant

### Authentication & Authorization
- User authentication
- Link-API impersonation support
- Role-based access control
- Cross-tenant authorization rules

### Payment Processing
- Multiple currency support (BRL, USD)
- Invoice management
- Transaction handling
- Payment method processing
- Merchant anticipation configuration

### User Management
- Shopper creation and management
- Merchant onboarding
- Product assignment
- Tenant configuration

## PayJIM Integration

### Recent Changes
- USD notation support for payment amounts
- Tenant ID handling for JIM users (tenant_id logic)
- User blocking: InfinitePay users should receive 404 on JIM payment links
- Link-API impersonation for JIM users in production

### Related PRs
- [#7157](https://github.com/cloudwalk/infinitepay-api-v2/pull/7157) - Block InfinitePay users from JIM links

## Architecture Components

### Invoice API
- Invoice creation and management
- Tenant ID integration (scope to be defined with Alberto)
- Product-specific invoice handling (product_id = 1 for JIM)

### Payment Processing
- Integration with risk engine (Severine)
- Payment method handling
- Transaction status management
- Receipt generation flow

### Data Model
- Shoppers with tenant_id
- Merchants with product associations
- Invoices with tenant context
- Transactions with multi-currency support

## Integration Points

### Frontend
- [[CNP Monorepo Overview]] - Payment links and checkout
- [[infinitepay-dashboard-js]] - Merchant dashboard
- [[infinitepay-receipt-js]] - Receipt display

### External Services
- **Severine**: Risk and compliance engine
- **Link-API**: Authentication and impersonation
- **SMS/WhatsApp**: Notification services
- **Payment Processors**: Card and wallet payments

## Configuration

### Product Configuration
- Product ID = 1 for JIM
- Product-specific settings and feature flags
- Merchant anticipation percentages by product

### Tenant Configuration
- Tenant-specific rules and settings
- Cross-tenant isolation
- Tenant-aware queries and data access

### Risk Configuration
- Severine rules for JIM transactions in PROD
- Transaction limits and validation
- Fraud detection settings

## Outstanding Questions

- [ ] Invoice API tenant_id scope - which entities need tenant context? (Discuss with Alberto)
- [ ] Shopper tenant_id = 2 configuration - should new JIM shoppers use this?
- [ ] Backend listen implementation - status and completion timeline
- [ ] Link product=1 usage - can this be used for JIM payments?

## Development

### Common Operations
- Creating/managing invoices
- Processing payments
- User authentication flows
- Tenant-aware queries
- Multi-currency transactions

### Testing
- Integration tests with frontend
- API endpoint testing
- Multi-tenant test scenarios
- Currency conversion testing

## Team Members

- **João José Carvalho Pedrini**: Backend USD support, domain config
- **Alberto**: Tenant ID architecture consultation
- **Marcus Vinícius**: User blocking, authorization rules

## Related Notes

- [[PayJIM Architecture]]
- [[PayJIM - Atividades]]
- [[CNP Monorepo Overview]]

---

## TODO
- [ ] Document API endpoints and contracts
- [ ] Create authentication flow diagrams
- [ ] Document tenant ID strategy after Alberto discussion
- [ ] Map payment processing flow in detail
- [ ] Document error handling and retry logic
- [ ] Create local development setup guide
