# SAP GUI launcher

Purpose: keep SAP GUI launch adapters separate from SAP credential storage.

Rules:

```text
- This folder may contain command-line execution adapters for SAP GUI / NWBC.
- Credentials must not be stored in repository files.
- Preferred credential source remains KeePass-backed keyflow SAP automation.
- Any adapter that receives credentials must be treated as a local execution bridge, not as the source of truth.
```

Current model:

```text
KeePassXC / keepassProviderCommand -> keyflow SAP service -> SAP GUI launcher adapter
```

Do not add company hosts, SAP connection files, certificates, passwords, or customer-specific system metadata here.
