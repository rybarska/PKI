#!/bin/sh

# Stop execution immediately if any command returns a non-zero status
set -e

# Certificate Verification Explained:
# Verification establishes trust in a certificate by checking several factors:
# 1. Cryptographic Signature: Ensures the certificate was signed by the claimed CA.
# 2. Certificate Chain: Ensures the signing CA is trusted (in this case, our Root CA).
# 3. Validity Period: Checks if the current date is within the certificate's valid timeframe.
# 4. Integrity: Ensures the certificate data has not been altered.

# Verify the server certificate against the Root CA
# openssl verify: The utility to verify certificate chains
# -CAfile certs/ca.crt: The file containing the trusted Root CA certificate
# certs/server.crt: The leaf certificate to verify
# We use '||' (OR operator) to catch a failure, print a custom message, and exit with error.
openssl verify -CAfile certs/ca.crt certs/server.crt || { echo "Verification FAILED"; exit 1; }

# If the previous command succeeded, print the success message
echo "Verification SUCCESS: The certificate is valid and trusted."
