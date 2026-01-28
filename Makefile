.PHONY: all ca csr cert verify clean

# Default target: execute the full certificate lifecycle
all: verify

# Generate Root CA private key and certificate
ca:
	./create_ca.sh

# Generate server private key and CSR
csr:
	./create_csr.sh

# Issue server certificate (depends on CA and CSR existing)
cert: ca csr
	./create_cert.sh

# Verify the issued certificate (depends on certificate being issued)
verify: cert
	./verify_cert.sh

# Remove all generated keys and certificates
clean:
	rm -rf certs
