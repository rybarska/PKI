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
