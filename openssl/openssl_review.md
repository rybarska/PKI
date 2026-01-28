# OpenSSL Certificate Review

## Purpose

This document describes the manual security inspection of the generated X.509
certificates using OpenSSL. The objective of this review is to verify that the
AI-generated PKI implementation produces cryptographically correct certificates
that comply with the task requirements.

The review focuses on certificate structure, cryptographic algorithms, validity
periods, and trust chain correctness.

## Tool Used

- **Tool:** OpenSSL
- **Context:** Manual inspection and verification of generated certificates

## Commands Executed

The server certificate was inspected using the following command:

```bash
openssl x509 -in certs/server.crt -text -noout
```

The certificate chain was verified using:

```bash
openssl verify -CAfile certs/ca.crt certs/server.crt
```

Results of Certificate Inspection
Cryptographic Algorithms
Signature Algorithm: ECDSA with SHA-256

Public Key Algorithm: Elliptic Curve (id-ecPublicKey)

Elliptic Curve: prime256v1 (NIST P-256)

These parameters match the task specification (ECDSA with secp256 and SHA-256)
and represent modern, recommended cryptographic choices.

Certificate Validity
Not Before: January 28, 2026

Not After: January 28, 2028

The two-year validity period complies with the task requirements for an
end-entity (server) certificate.

Subject and Issuer Fields
Issuer: C=AT, CN=CA_1

Subject: C=AT, CN=server_1

The issuer and subject fields correctly reflect a server certificate signed by
the locally generated root CA.

X.509 Extensions
The following standard extensions were present:

Subject Key Identifier

Authority Key Identifier

No unexpected or misconfigured extensions were observed for this minimal PKI.

Certificate Chain Verification
The certificate chain verification produced the following result:

```bash
certs/server.crt: OK
```
This confirms that the server certificate was correctly signed by the trusted
root CA and that the certificate chain is valid.

Security Assessment Summary
Modern cryptographic algorithms and key sizes are used.

Certificate validity periods conform to task requirements.

The certificate chain verifies successfully.

No structural or cryptographic issues were identified during manual inspection.

Overall, the OpenSSL-based review confirms that the generated certificates are
functionally correct and suitable for demonstrating the PKI lifecycle in an
educational context.

Limitations
This review does not evaluate:

Compliance with public CA policies (e.g. CA/B Forum requirements)

TLS protocol configuration or runtime security

Certificate revocation mechanisms (CRL or OCSP)

These aspects are outside the scope of this assignment.
