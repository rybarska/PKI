# PKI

# Minimal PKI Implementation (Educational Prototype)

⚠️ **Important notice** 
This is a short academic exercise for the course "Software Security" at USTP St Pölten.
This repository contains **only the results of the exercise**, not the exercise description itself.  
The original task specification is **not published** due to explicit non-distribution requirements.

---

## Overview

This repository contains a **minimal Public Key Infrastructure (PKI) prototype** developed for educational purposes in the context of a graduate-level course on **Software Security** and **Secure Software Lifecycle practices**.

The implementation was intentionally created with the assistance of **AI-based code generation**, and subsequently **reviewed and evaluated from a software security perspective**.

The goal of this work is not to provide a production-ready PKI, but to:
- Understand the certificate lifecycle end-to-end
- Practice secure software review techniques
- Identify weaknesses introduced by AI-generated code
- Reflect on security implications early in the software lifecycle

---

## Scope of This Repository

This repository includes:

- Shell scripts for a **very limited PKI workflow**
- Inline documentation explaining each step
- Artifacts required to:
  - Generate cryptographic keys
  - Create certificates and CSRs
  - Issue and verify certificates

This repository **does not include**:
- The original exercise description
- Slides, grading criteria, or internal course materials
- The full written report or presentation

---

## Implemented PKI Features

The prototype supports the following operations:

1. **Root CA creation**
   - Generation of a private key
   - Creation of a self-signed root certificate

2. **Server key and CSR generation**
   - Private key generation
   - Certificate Signing Request (CSR) creation

3. **Certificate issuance**
   - Signing the server CSR using the root CA private key

4. **Certificate verification**
   - Validation of the issued server certificate against the root CA

5. **Script-based workflow**
   - All steps are implemented as shell scripts
   - Each script contains inline comments explaining:
     - What is executed
     - Why it is required
     - Which security assumptions are made

---

## Repository Structure

```text
.
├── create_ca.sh        # Generates root CA key and self-signed certificate
├── create_csr.sh       # Generates server key and CSR
├── create_cert.sh      # Issues server certificate using the CA
├── verify_cert.sh      # Verifies the issued certificate
├── ca/                 # CA key and certificate (local, ignored if applicable)
├── server/             # Server keys and certificates
└── README.md
