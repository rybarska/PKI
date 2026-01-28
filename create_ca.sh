#!/bin/sh

# Stop execution immediately if any command returns a non-zero status
set -e

# Ensure the output directory exists
# -p: Create parent directories as needed, no error if it exists
mkdir -p certs

# Step 1: Generate the Root CA Private Key
# openssl ecparam: Run the Elliptic Curve parameter manipulation tool
# -name secp256r1: Specify the curve to use (NIST P-256)
# -genkey: Generate an EC private key instead of just parameters
# -noout: Do not print the encoded parameters to standard output
# -out certs/ca.key: Save the generated private key to this file
openssl ecparam -name secp256r1 -genkey -noout -out certs/ca.key

# Step 2: Generate the Self-Signed Root CA Certificate
# openssl req: Run the certificate request and certificate generating tool
# -new: Create a new certificate request (implied by -x509)
# -x509: Output a self-signed certificate instead of a CSR
# -sha256: Use the SHA-256 hash algorithm for the signature
# -key certs/ca.key: Read the private key from this file to sign the certificate
# -out certs/ca.crt: Save the generated certificate to this file
# -days 3650: Set the certificate validity period to 10 years
# -subj "/C=AT/CN=CA_1": Set the certificate subject (Country=AT, Common Name=CA_1)
openssl req -new -x509 -sha256 -key certs/ca.key -out certs/ca.crt -days 3650 -subj "/C=AT/CN=CA_1"
