# BillFlow – RWA Invoice Factoring Protocol

BillFlow is a decentralized protocol that enables Small and Medium Enterprises (SMEs) to unlock instant liquidity by tokenizing real-world invoices into NFTs and using them as collateral for DeFi lending.

This project was built as an MVP for a blockchain hackathon in the **Real World Assets (RWA) / DeFi** track.

---

## 🔹 Problem

SMEs often face severe cash flow constraints due to long invoice payment cycles (30–90 days).

- Capital is locked while waiting for buyers to pay
- Bank loans require collateral and long approval times
- Cash shortages limit business growth and operations

---

## 🔹 Solution

BillFlow transforms traditional invoices into on-chain financial assets.

- Real-world invoices are tokenized into **ERC-721 NFTs**
- Invoice NFTs are used as collateral in a lending pool
- SMEs receive instant liquidity via smart contracts

**Result:** Convert illiquid invoices into cash within minutes instead of weeks.

---

## 🔹 How It Works

1. **Mint**  
   SMEs upload invoice information and mint an Invoice NFT.

2. **Lock**  
   The Invoice NFT is locked as collateral in the lending pool.

3. **Cash-out**  
   Smart contracts automatically disburse USDT to the SME wallet based on the invoice risk tier.

---

## 🔹 Architecture

### Core Components
- ERC-721 Invoice NFT Contract
- Lending Pool Smart Contract
- Mock USDT Token
- Frontend Interface (Demo UI)
- Oracle-based Invoice Verification (Mock for MVP)
### Roadmap
- Replace mock oracle with decentralized oracle networks (e.g. Chainlink)

---

## 🔹 Lending Logic (Risk-Based Model)

BillFlow applies a **risk-tiered lending model** instead of a fixed Loan-to-Value (LTV).

- Collateral: Invoice NFT  
- Asset: USDT  
- Network: Ethereum Sepolia Testnet  

### Risk Tiers

- **Tier A – Low Risk**  
  - Invoices issued by governments or multinational corporations  
  - LTV: **85–90%**  
  - Fee: **1%**

- **Tier B – Standard (Applied in Demo)**  
  - SMEs with operating history > 2 years  
  - LTV: **~70%**  
  - Fee: **2%**

- **Tier C – High Risk**  
  - New businesses or small-value invoices  
  - LTV: **below 50%**  
  - Fee: **3%**

> The demo version of BillFlow currently applies **Tier B** to ensure safety and simplicity during the MVP phase.

---

## 🔹 Risk Management & Default Handling

BillFlow focuses on **risk transparency and control**, not risk elimination.
### Invoice Verification
Invoices are verified off-chain by trusted partners 
(e.g. logistics providers, ERP systems, accounting platforms).  
Verified invoice hashes are submitted on-chain via a mock oracle contract 
for the MVP phase.

### Over-Collateralized Lending
- Conservative LTV ratios provide safety buffers
- Protects liquidity providers from downside risk

### Default Handling
- If an invoice is unpaid after maturity:
  - The Invoice NFT collateral is **liquidated**
  - Lenders receive **claim rights over the invoice cash flow**
  - NFTs can be transferred or traded in secondary markets

---

## 🔹 Design Philosophy

> BillFlow does not eliminate risk —  
> it makes risk **transparent, programmable, and tradable** using blockchain technology.

---

## 🔹 Tech Stack

- **Blockchain:** Ethereum (Sepolia Testnet)
- **Smart Contracts:** Solidity, Hardhat
- **Token Standard:** ERC-721
- **Frontend:** Next.js, Tailwind CSS
- **Wallet:** MetaMask (Demo)

---

## 🔹 Deployed Contracts

> **Note:** The contracts are currently deployed and tested on **Remix IDE (Remix VM - Cancun)** for demonstration purposes.

- **BillNFT Contract:** `Available in Remix Artifacts`
- **LendingPool Contract:** `Available in Remix Artifacts`

## 🔹 Roadmap

- **Q1/2026:** MVP completion & testnet deployment  
- **Q2/2026:** Oracle integration & invoice verification partners  
- **Q3/2026:** Mainnet launch & mobile application  

---

## 🔹 Disclaimer

BillFlow is an experimental MVP developed for hackathon purposes.  
It is not a financial product and has not undergone security audits.





📦 Installation

```bash
git clone [https://github.com/hongtham060406-byte/BillFlow.git](https://github.com/hongtham060406-byte/BillFlow.git)
cd BillFlow
npm install
npx hardhat node

👥 Team

Phạm Thị Hồng Thắm - Developer

Nguyễn Anh Oanh - Designer

Made with ❤️ by Team OT.













