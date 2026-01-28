# PKI

# Minimal PKI Implementation (Educational Prototype)

⚠️ **Important notice** 
This is a short academic exercise for the course "Software Security" at USTP St Pölten.
This repository contains **only the implementation results** of an academic exercise.  
The original task description, slides, and internal course materials are **not published** and are intentionally omitted.

---

## Overview

This repository contains a **minimal Public Key Infrastructure (PKI) prototype** developed for educational purposes in the context of a graduate-level course on **Software Security**.

The PKI was intentionally implemented using **AI-assisted code generation** and then reviewed from a **software security and source code analysis perspective**. The focus is on understanding the *certificate lifecycle* and identifying security-relevant design and implementation weaknesses.

This is **not** a production-ready PKI.

---

## Scope

Included in this repository:

- Shell scripts implementing a basic PKI workflow
- A `Makefile` to orchestrate the lifecycle steps
- Inline comments explaining each cryptographic and operational step
- Generated certificates and keys stored locally

Explicitly **not included**:

- The original exercise statement
- Course slides or grading criteria
- The written report or presentation material

---

## Implemented Functionality

The prototype supports the following PKI operations:

1. **Root CA creation**
   - Generation of a private key
   - Creation of a self-signed root certificate

2. **Server key and CSR generation**
   - Private key generation
   - Certificate Signing Request (CSR) creation

3. **Certificate issuance**
   - Signing the server CSR using the root CA private key

4. **Certificate verification**
   - Verification of the issued server certificate against the root CA

5. **Automated workflow**
   - A `Makefile` is provided to run the above steps in a reproducible manner

---

## Repository Structure

```text
pki/
├── Makefile            # Orchestrates PKI lifecycle steps
├── create_ca.sh        # Root CA key and self-signed certificate generation
├── create_csr.sh       # Server key and CSR creation
├── create_cert.sh      # Server certificate issuance by the CA
├── verify_cert.sh      # Certificate verification
└── certs/              # Generated keys, CSRs, and certificates
```

Run `make` to execute the full workflow, and `make clean` to remove generated artifacts.
