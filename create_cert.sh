#!/bin/sh

# Stop execution immediately if any command returns a non-zero status
set -e

# Certificate Signing Process:
# 1. The CA (Certificate Authority) receives the CSR.
# 2. The CA validates the information in the CSR and ensures the request signature is valid.
# 3. The CA uses its own private key and certificate to issue a new certificate based on the CSR.
# 4. This new certificate binds the public key (from the CSR) to the identity (subject)
#    and is trusted by anyone who trusts the CA.

# Issue the server certificate
# openssl x509: Run the X.509 certificate utility
# -req: Input is a Certificate Signing Request (CSR) rather than a certificate
# -in certs/server.csr: The input CSR file containing the public key and subject
# -CA certs/ca.crt: The CA certificate used for signing (issuer)
# -CAkey certs/ca.key: The CA private key used to cryptographically sign the new certificate
# -CAcreateserial: Generate a random serial number for the certificate if a serial file doesn't exist
# -out certs/server.crt: The path where the signed certificate will be written
# -days 730: Set the validity period of the certificate to 2 years (2 * 365)
# -sha256: Use the SHA-256 hash algorithm for the signature
openssl x509 -req -in certs/server.csr -CA certs/ca.crt -CAkey certs/ca.key -CAcreateserial -out certs/server.crt -days 730 -sha256
