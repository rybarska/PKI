# AI Prompting Methodology

This document summarizes the **AI prompting strategy** used to generate the PKI prototype contained in this repository.

The prompts are provided for **transparency and reproducibility** in the context of analyzing AI-assisted software development from a software security perspective.  
They are intentionally generalized and do **not** reproduce any internal course material or task descriptions.

---

## Global System Constraints

At the beginning of the interaction, the AI system was constrained to behave as a **minimalist software generator** with the following guiding principles:

- Generate only explicitly requested functionality
- Prefer simplicity over completeness
- Use OpenSSL and POSIX-compatible shell scripts exclusively
- Avoid containerization, services, networking, or runtime daemons
- Do not introduce security hardening beyond stated requirements
- Rely on OpenSSL defaults unless explicitly instructed otherwise
- Explain every shell command using inline comments
- Produce deterministic and reproducible output

The generated PKI was intentionally minimal and incomplete by design, in order to support later **security review and analysis**.  
Security weaknesses were considered acceptable within this educational context.

When requirements were ambiguous, the simplest reasonable option was chosen and documented in comments.

---

## Prompt 1: Project Structure

**Objective**  
Generate a minimal directory structure for a simple PKI project.

**Key constraints**
- Focus exclusively on the certificate lifecycle
- Use shell scripts and a Makefile
- Place all generated keys and certificates in a dedicated `certs/` directory

**Expected output**
- Directory tree
- One-line explanation of each file

---

## Prompt 2: Root CA Generation Script

**Objective**  
Generate a POSIX-compatible shell script to create a root Certificate Authority.

**Key parameters**
- Algorithm: ECDSA
- Curve: secp256r1
- Hash: SHA-256
- Certificate validity: long-lived
- Self-signed root certificate
- Fixed subject fields (e.g., country and common name)

**Constraints**
- OpenSSL CLI only
- No encrypted private keys
- No OpenSSL configuration files
- Inline explanation of every command and flag
- Immediate termination on errors (`set -e`)

**Expected output**
- Shell script content only

---

## Prompt 3: Server Key and CSR Script

**Objective**  
Generate a shell script to create a server private key and a Certificate Signing Request (CSR).

**Key parameters**
- Algorithm: ECDSA
- Curve: secp256r1
- Hash: SHA-256
- Fixed subject fields

**Constraints**
- OpenSSL CLI only
- No encrypted private keys
- No configuration files
- Explain the purpose of a CSR in comments
- Inline explanation of all OpenSSL flags
- Immediate termination on errors (`set -e`)

**Expected output**
- Shell script content only

---

## Prompt 4: Certificate Issuance Script

**Objective**  
Generate a shell script to issue a server certificate based on a CSR and sign it using the root CA.

**Key parameters**
- Algorithm: ECDSA
- Hash: SHA-256
- Certificate validity: limited lifetime

**Constraints**
- OpenSSL CLI only
- No certificate extensions unless strictly required
- No Subject Alternative Names (SANs)
- Explain the certificate signing process in comments
- Inline explanation of all OpenSSL flags
- Immediate termination on errors (`set -e`)

**Expected output**
- Shell script content only

---

## Prompt 5: Certificate Verification Script

**Objective**  
Generate a shell script to verify a server certificate against the root CA certificate.

**Constraints**
- Use OpenSSL verification commands
- Print a human-readable success or failure message
- Exit with a non-zero status code on failure
- Explain certificate verification conceptually in comments
- Inline explanation of all OpenSSL flags
- Immediate termination on errors (`set -e`)

**Expected output**
- Shell script content only

---

## Prompt 6: Makefile Generation

**Objective**  
Generate a minimal Makefile to orchestrate the PKI lifecycle.

**Required targets**
- `all` (default): execute full lifecycle
- `ca`: generate root CA
- `csr`: generate server key and CSR
- `cert`: issue server certificate
- `verify`: verify issued certificate
- `clean`: remove generated artifacts

**Constraints**
- Targets must invoke shell scripts only
- Correct logical execution order
- Brief comments explaining each target
- Assume scripts are executable

**Expected output**
- Makefile content only

---

## Prompt 7: AI Self-Review (Security Analysis)

**Objective**  
Perform a security-oriented review of the generated PKI implementation.

**Focus areas**
- Key handling
- Certificate contents
- Automation risks
- Reliance on OpenSSL defaults
- Missing controls and safeguards

**Constraints**
- Identify weaknesses only
- Do not propose fixes or improvements
- Do not harden the implementation
- Analysis is strictly educational

**Expected output**
- Bullet-point findings grouped by category
