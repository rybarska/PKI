#!/bin/sh

# Stop execution immediately if any command returns a non-zero status
set -e

# What is a CSR?
# A Certificate Signing Request (CSR) is a block of encoded text sent to a
# Certificate Authority (CA) to apply for a digital certificate. It contains
# information that will be included in the certificate (like the Common Name
# and Country) and the public key. It is signed by the corresponding private
# key to prove that the requester possesses it.

# Ensure the output directory exists
# -p: Create parent directories as needed, no error if it exists
mkdir -p certs

# Step 1: Generate the Server Private Key
# openssl ecparam: Tool for manipulating or generating elliptic curve parameters
# -name secp256r1: Specify the elliptic curve to use (NIST P-256)
# -genkey: Generate a private key based on the parameters
# -noout: Do not print the encoded parameters to standard output
# -out certs/server.key: Save the generated private key to this file
openssl ecparam -name secp256r1 -genkey -noout -out certs/server.key

# Step 2: Generate the Certificate Signing Request (CSR)
# openssl req: PKCS#10 certificate request and certificate generating utility
# -new: Generate a new certificate request
# -sha256: Use the SHA-256 message digest algorithm for the signature
# -key certs/server.key: Read the private key from this file to sign the CSR
# -out certs/server.csr: Save the generated CSR to this file
# -subj "/C=AT/CN=server_1": Set the subject name fields (Country=AT, Common Name=server_1)
openssl req -new -sha256 -key certs/server.key -out certs/server.csr -subj "/C=AT/CN=server_1"
