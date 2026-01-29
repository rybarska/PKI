# Semgrep Security Analysis

## Tool
Semgrep (static application security testing – SAST)

## Scope of Analysis
Semgrep was used to perform a static security analysis of the shell scripts implementing the PKI workflow.  
The analysis focused on identifying:
- Insecure cryptographic practices
- Weak key handling
- Unsafe file permissions
- Missing verification steps
- Common shell scripting security issues

Custom Semgrep rules were defined specifically for this project to reflect PKI-related risks rather than generic coding issues.

## Configuration
The analysis was executed using a custom rule set located at:

semgrep/semgrep-pki.yml

The scan was run with the following command:

```bash
semgrep --config=semgrep/semgrep-pki.yml
```

### Findings

Semgrep reported the following security-relevant issue:

- **Hardcoded or Exposed Private Key Material (CWE-321 / CWE-522)**  
  Semgrep detected that private key files are generated and stored without encryption or access control mechanisms. The generated private keys (`ca.key`, `server.key`) are written directly to disk in plaintext, making them immediately usable if filesystem access is compromised.

### Severity Assessment

The identified issue was classified as **High severity**, as exposure of private key material directly compromises the security of the PKI. Possession of the CA private key allows an attacker to issue arbitrary certificates, fully breaking the trust model.

### Tool Limitations Observed

Semgrep did not report issues related to:
- Certificate semantics (e.g., missing `Subject Alternative Name`)
- Cryptographic parameter choices (key size, hash algorithm)
- Certificate lifecycle management (revocation, expiration policies)
- Trust model design (root CA isolation, CSR validation)

This indicates that Semgrep is effective at detecting low-level code patterns but does not reason about higher-level PKI design or cryptographic correctness.

### Conclusion

The Semgrep analysis successfully identified direct exposure of sensitive cryptographic material but did not detect structural or architectural weaknesses of the PKI implementation. This confirms that static analysis tools provide valuable baseline checks but must be complemented by additional evaluation methods when assessing security-critical systems.
