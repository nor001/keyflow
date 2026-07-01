# macOS configuration

Purpose: essential manual configuration after `install/macos/install.sh`.

This is a starting point for the Mac migration. Keep it small until real usage proves what should become stable keyflow architecture.

## System

```text
System Settings -> Appearance -> Dark
System Settings -> Desktop & Dock:
  Automatically hide and show Dock: optional
  Show suggested and recent apps in Dock: Off
System Settings -> Control Center:
  Battery: Show percentage
System Settings -> Keyboard:
  Key repeat rate: Fast
  Delay until repeat: Short
  Keyboard Shortcuts -> Input Sources: disable conflicting shortcuts if you use one language
System Settings -> Trackpad / Mouse:
  Tracking speed: high but controllable
  Secondary click: On
  Natural scrolling: choose once and keep stable
System Settings -> Displays:
  Set scaled resolution intentionally per monitor
System Settings -> Lock Screen:
  Require password immediately after sleep/screensaver
```

## Finder

```text
Finder -> Settings -> General:
  New Finder windows show: home or working folder
Finder -> Settings -> Sidebar:
  Enable home, external disks, cloud folders only if used
Finder -> Settings -> Advanced:
  Show all filename extensions: On
  Show warning before changing extension: On
  When performing a search: Search the current folder
View Options:
  Show Path Bar: On
  Show Status Bar: On
```

Useful commands:

```bash
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
chflags nohidden ~/Library
```

## Keyboard and window management

Raycast:

```text
Set Raycast hotkey: Option+Space or Command+Space if replacing Spotlight
Disable Raycast features you do not use
Enable clipboard/history only if Maccy is not primary
```

Maccy:

```text
Set shortcut: Command+Shift+V or preferred clipboard shortcut
Storage: plain text first; enable images only if needed
Ignore KeePassXC/password fields where possible
```

Rectangle:

```text
Enable common window shortcuts
Validate no conflict with keyflow future mac layer
```

AltTab:

```text
Use if you want Windows-like window switching
Configure shortcut intentionally to avoid conflicting with macOS app switcher
```

## Browser

Firefox / Chrome:

```text
Sign in only if sync is trusted
Install KeePassXC browser integration
Pin core tabs only after 48h of real use
```

## Security and credentials

KeePassXC:

```text
Settings -> General:
  Minimize instead of app exit
  Show tray/menu bar icon if useful
Browser integration:
  Firefox: On
  Chrome: On only if used
  Passkeys: validate manually
```

Do not commit:

```text
KeePass databases
recovery keys
company URLs
VPN profiles
SAP connection files
SSH private keys
```

## Development

VS Code:

```text
Turn on Settings Sync only after verifying the Mac keyboard layout
Install only required extensions first
Validate terminal shell and PATH
```

Cursor:

```text
Login
Validate agent permissions before using on private/company repos
Keep settings close to VS Code unless a Mac-specific difference is proven
```

Claude Code:

```bash
claude --version
```

Git:

```bash
git --version
git config --global user.name
git config --global user.email
git config --global init.defaultBranch main
```

Node / Python:

```bash
node --version
npm --version
python3 --version
```

## SAP / Eclipse

```text
Install SAP GUI / SAP Logon only through company/SAP-approved channel.
Install Eclipse ADT from: https://tools.hana.ondemand.com/latest
Keep SAP connection configuration local-only.
```

Eclipse baseline:

```text
Text font: DejaVu Sans Mono or JetBrains Mono, size 9-11
Displayed tab width: 2
Spelling: Off
ABAP completion: tune only after first real SAP session
```

## Audio / focus

eqMac:

```text
Use as FxSound-like starting point only if Mac audio needs correction
Start with minimal EQ; avoid over-tuning before daily validation
```

KeepingYouAwake:

```text
Use only for presentations, long downloads, or controlled work sessions
Do not use as default anti-sleep behavior
```

Stretchly:

```text
Start with gentle reminders
Disable if it interrupts deep work too aggressively
```

## Mouse: Logitech MX Ergo

```text
Install Logi Options+ manually or through Homebrew if available
Configure pointer speed, button mappings, and app-specific shortcuts
Do not encode personal button mappings into keyflow until stable for 48-72h
```

## Files and sync

```text
Use `.sync` as portable root.
Do not sync full macOS applications as first strategy.
Prefer install/macos manifests + Homebrew reinstallability.
Keep external-drive names stable if scripts depend on them.
```

## First-run validation

```bash
git --version
node --version
python3 --version
code --version
cursor --version
claude --version
brew --version
```

Success criterion: the Mac is usable for development, notes, browsing, credentials, and keyflow migration experiments without copying Windows portable binaries.
