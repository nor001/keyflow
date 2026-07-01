# Windows manual follow-up

Use this after `install.ps1`. Keep private/corporate data out of the repo.

## Must stay manual

- SAP GUI / SAP Logon installer from company portal or official SAP channel.
- SAP Logon configuration, customer host entries, SNC/SSO/certificates.
- Corporate VPN clients, Okta/device enrollment, OneDrive tenant setup.
- VMware images and guest OS activation.
- Paid license registration for Beyond Compare, Groupy, XYplorer, or similar tools.
- Mouse-specific Logi Options+ tuning for MX Ergo.
- FxSound preset selection per headset/speaker.
- VS Code, Cursor, Firefox, Chrome, Obsidian, KeePassXC sync/login.

## Optional manual URLs

- Comet: https://www.perplexity.ai/comet
- SAP GUI for Windows: use company portal/SAP Software Downloads according to license.
- VMware Workstation Pro: use Broadcom/VMware official portal if WinGet package is unavailable.
- Logitech Options+: https://www.logitech.com/software/options.html

## Local-only items that must not be committed

```text
registration keys
company URLs
VPN installers
host file entries
KeePass databases
SAP connection files
OneDrive tenant paths
USB drive letters
personal user names
```

## First-run checklist

```text
1. Restart terminal so PATH refreshes.
2. Run: git --version
3. Run: node --version
4. Run: python --version
5. Run: code --version
6. Run: claude --version
7. Configure VS Code Settings Sync.
8. Configure Cursor login/settings.
9. Configure KeePassXC browser integration and passkeys.
10. Configure Logi Options+ for MX Ergo.
11. Configure SAP GUI/Logon manually.
12. Launch keyflow after AutoHotkey v2 is confirmed.
```
