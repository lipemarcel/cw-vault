---
created: 2025-10-14
tags: [cnp, feature, payjim, doing]
project: PayJIM
repository: infinitepay-cnp-monorepo
---

# PayJIM - Atividades

Project tracking for PayJIM implementation tasks across the CNP monorepo and related services.

## Status Overview

- **Mergeado**: Completed and merged
- **Fazendo**: Currently in progress
- **PR review**: Waiting for review
- **Feito**: Done
- Blank: Not started or blocked

---

## Tela Inicial (Home Screen)

### ✅ Mergeado
- [x] Rastrear os R$ e mudar pra USD - [PR #725](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/725)
- [x] Mudar o Footer (link pra Termos e condições) - [PR #724](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/724)

### 🔨 Fazendo
- [ ] Mudar as bandeiras aceitas
- [ ] Mudar a logo pra JIM

### ⚠️ Issues
- [ ] Corrigir a funcionalidade, ta com uma validação quebrada

---

## Tela Pagamento (Payment Screen)

### ✅ Mergeado
- [x] Rasterar os R$ e mudar pra USD - [PR #725](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/725)
- [x] Tirar o parcelamento (wallet) - [PR #729](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/729)
- [x] Tirar o parcelamento (credit) - [PR #729](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/729)
- [x] Mudar link pro termo e condições - [PR #724](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/724)
- [x] DDI inicial precisa ser +1 EUA - [PR #726](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/726)
- [x] Precisa enviar primeiro pra SMS - [PR #732](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/732)

### 🔨 Fazendo
- [ ] Mudar avatar padrão
- [ ] Mudar logo do footer
- [ ] Mudar as bandeiras disponíveis
- [ ] Remover CPF/CNPJ - **Marcus** - [PR #737](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/737)
- [ ] Precisamos mudar a forma de pegar endereço, pelo menos remover ViaCEP (ver com Onboarding) - **Marcus** - Primeiro só colocar campos, depois integrar

### 📋 Blocked/Pending
- [ ] Fazer enviar SMS/Whats em inglês - **Falar com Rafa Vieira**

---

## Wallets

### 👀 PR Review
- [ ] Mudar pra USD no APPLE PAY e GOOGLE PAY - [PR #735](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/735)

---

## Geral (General)

### ✅ Feito/Mergeado
- [x] Criar Sentry pro PayJim - [Sentry Project](https://cloudwalk-inc.sentry.io/issues/?project=4510108586606592)
- [x] Ajuste de formatação da URL do Pay-Jim para aceitar o . (Ex: VCD-10.00 e não 10,00) - [PR #730](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/730)

### 👀 PR Review
- [ ] Forçar o tema dark - [PR #738](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/738)
- [ ] Quando acessar com um user InfinitePay, precisa dar not found - **Marcus**
  - [infinitepay-api-v2 PR #7157](https://github.com/cloudwalk/infinitepay-api-v2/pull/7157)
  - [cnp-monorepo PR #740](https://github.com/cloudwalk/infinitepay-cnp-monorepo/pull/740)

### 📋 Todo/Blocked
- [ ] Criar Rudderstack - Rudder ta criado e referenciado no secret, porém precisa configurar a connection pra enviar pro amplitude
- [ ] Criar Clarity - **Falar com Shazam**
- [ ] Verificar se tem mais / Google GTM / etc
- [ ] Tem uma porrada de erro no console (parece CSP, mas tem que ver)
- [ ] Tirar fallback (pay.jim/com/10.00) do PayJim

---

## Backend

### ✅ Mergeado
- [x] Aceitar valores com USD notation - **João**
- [x] Adicionar pay.jim.com - **João**

### 📋 Todo
- [ ] Verificar se poddemos usar o link=1 product

---

## Recibos (Receipts)

### 📋 Todo
- [ ] Não pode redirecionar pra recibo do infinitepay, precisa mostrar algo no link de pagamento - **Marcus** - Layout do social sem produto

---

## Onboarding

### 📋 Todo
- [ ] Product ID =1
- [ ] merchant_anticipation_percentages no wallet está com D1

---

## Monorepo

### 🔨 Fazendo
- [ ] Está sendo feito listen no backend - **Marcus**

---

## AUTH & RISK (Production Config)

### 📋 Todo
- [ ] [AUTH] Authorizar link-api impersonar usuário JIM em PROD
- [ ] [RISK] Permitir transação JIM no Severine em PROD

---

## Questions/To Clarify

- [ ] Shopper criado fica com tenant_id = 2? Precisa liberar o shopper novo?
- [ ] Adicionar tenant_id na invoice-api (trocar ideia com o Alberto pra saber se precisa colocar em todos ou só nas entidades principais)

---

## Related Notes

- [[CNP Monorepo Overview]]
- [[PayJIM Architecture]]
- [[InfinitePay API v2]]

## Team Members

- Fellipe Marcel Maia Silva (You)
- Marcus Vinícius Ventura Bortolotti
- João José Carvalho Pedrini
- Rafa Vieira (SMS/Whats contact)
- Shazam (Clarity contact)
- Alberto (tenant_id discussion)
