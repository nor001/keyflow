# Windows configuration

Purpose: manual golden configuration after `install/windows/install.ps1`.

Keep this file free of secrets, company URLs, host entries, license keys, USB drive letters, KeePass databases, SAP connection files, and personal usernames.

## System

Settings:

```text
System -> Multitasking -> Alt+Tab -> Open windows only
Devices -> Typing -> Advanced keyboard settings -> Input language hot keys -> None
Devices -> Mouse -> Primary button: Right; pointer speed: Max
Personalization -> Colors -> Dark mode; transparent effects: Off
Time & language -> Language -> English
Time & language -> Region -> Regional format: Peru
Additional settings -> Decimal symbol: . ; List separator: , ; Measurement system: Metric
Search -> Permissions/history: Off where possible
Search -> Advanced search indexer settings: configure intentionally
Windows features -> Enable Windows Subsystem for Linux only when needed
```

Performance:

```text
Edit system environment variables -> Performance -> Settings -> Custom
On: show window contents while dragging
On: smooth edges of screen fonts
```

## Backup

```text
Downloads/.sync -> USB/.sync_with_folder_download
```

## Startup

```text
shell:startup
- create keyflow/app shortcut when needed
- create local temp shortcut only if the target is local-only and not committed
```

## Search: Everything

```text
View -> Menu bar: Off
Add column: Run Count; move first; sort descending
Options -> General -> Fonts and colors:
  Search edit size: 13
  Result list size: 10
Options -> Keyboard -> Show window hotkey: Alt+Space
Options -> Indexes -> NTFS -> Automatically include new fixed volumes: Off
Options -> Folders -> add only intentional fixed/search volumes
Options -> Content -> index *.md if needed
Options -> Exclude -> add filters: .*, *node_modules*
Options -> Advanced:
  On: close_on_deactivate, show_window_on_monitor_from_cursor
  Off: alpha_instance
```

## KeePassXC

```text
Settings -> General -> Auto-Type -> Global shortcut: Ctrl+Alt+F1
Settings -> General -> User interface:
  Minimize instead of app exit
  Show system tray icon
  Hide window to system tray when minimized
Settings -> Security -> Use DuckDuckGo service to download website icons
Settings -> Browser integration:
  Firefox: On
  Allow using localhost with passkeys: On
```

KeePassXC browser extension:

```text
Automatically fill single-credential entries
Automatically fill single TOTP entries
Automatically fill HTTP basic auth credentials
Save domain only
Download favicon after save
Enable passkeys
Reference: https://keepassxc.org/docs/#faq-browser-string-fields
```

## Capture and media

Snipaste:

```text
Preferences -> Control -> Snip -> PrintScreen
Disable competing capture shortcuts if necessary
```

ShareX:

```text
Application settings -> General -> Minimize to tray on start: On
Hotkey settings -> Start/stop screen recording GIF: Ctrl+PrintScreen
```

f.lux:

```text
Options -> Features and notifications -> hotkeys: Off
Custom color -> Classic f.lux -> 5200K
```

## Browsers

Firefox references:

```text
https://github.com/yokoffing/Betterfox
https://github.com/yokoffing/filterlists
```

## Office

```text
Word -> VBA setup if needed
Excel -> VBA setup if needed
Outlook:
  View -> Change View -> create NTP view copied from single
  Columns: importance, attachment, from, to, subject, received, categories, mention
  Options -> Mail -> Signatures
  Favorites: Inbox, Sent Items, Archive, Deleted Items
```

## Editors

Notepad++:

```text
Plugins: ComparePlus, JSTool, XML Tools
Language -> User Defined Language -> copy ABAP definition
Preferences:
  Dark mode -> Follow Windows
  Auto-completion -> On for each input
  Language -> Tab size: 2
Import style theme -> Dracula
Style configurator:
  Theme: Dracula
  Font: DejaVu Sans Mono
  Font size: 9
  Global font: On
  Global font size: On
```

Sublime Text:

```text
Tools -> Install Package Control
Packages: ABAP, Dracula Color Scheme
Color scheme: Dracula
Settings:
{
  "font_face": "dejavu sans mono",
  "font_size": 10,
  "caret_extra_bottom": 0,
  "caret_extra_top": 0,
  "scroll_speed": 0
}
Key bindings:
{ "keys": ["alt+j"], "command": "text_highlighter_toggle" },
{ "keys": ["ctrl+alt+j"], "command": "text_highlighter_clear_all" }
```

## SAP Logon

```text
Options -> Interaction Design:
  Visualization 1 -> Show key in dropdown lists
  Visualization 2 -> Show system name in system tray
  Visualization 2 -> Use shortcut to call extended search
Local data -> History -> Enable history up to 255
Security -> Configuration -> Off only if allowed by company policy
SAP Logon options -> Language: ES
Configuration file sync remains local-only/company-specific
```

## Eclipse / ADT

```text
Help -> Install New Software -> https://tools.hana.ondemand.com/latest
Marketplace: Eclipse User Storage, GitHub Copilot if needed
Window -> Preferences -> General -> Appearance -> Colors and Fonts:
  ABAP syntax coloring:
    Comment: 98 114 164
    Identifier: 248 248 242
    Keyword: 255 121 198
    Literal: 241 250 111
    Number literal: 189 147 249
  Basic -> Text font: DejaVu Sans Mono 9
General -> Editors -> Text Editors -> Displayed tab width: 2
General -> Editors -> Text Editors -> Spelling: Off
General -> Keys -> Open SAP GUI for Object: Ctrl+Shift+6
ABAP Development -> Editors -> Source Code Editors:
  Automatically close brackets and literals: Off
  Code completion -> Always insert full signature: On
  Code completion -> Also suggest non-keywords: On
```

## Flow Launcher

```text
Plugins:
  Browser bookmarks -> Firefox
  Explorer -> Index Search Engine -> Everything
  Explorer -> Content Search Engine -> Everything
  Explorer -> Directory recursive search -> Everything
Appearance:
  Animation: Off
  Sound effect: Off
```

## PDF and compare tools

PDF-XChange Editor:

```text
Toolbar: Home, Comment
Preferences:
  Page display -> Default page layout: Two pages continuous, 90%
  Accessibility -> Create Norman_gray page background color: light gray
  Customize UI -> Allow dark mode from system
```

WinMerge:

```text
View -> Select font -> DejaVu Sans Mono 9
```

DocFetcher:

```text
Index -> abap_src
```

Beyond Compare:

```text
Options -> Colors, Fonts -> Default text: Consolas 9
Toolbars:
  Home -> only active: minor, rules, compare, expand, full refresh, swap
  Text compare:
    Copy to left: Alt+Left
    Copy to right: Alt+Right
    Ignored: Alt+I
    Next different file: Alt+PageDown
    Next different section: Alt+Down
    Previous different file: Alt+PageUp
    Previous different section: Alt+Up
Rules snippets to preserve:
  <ACTFLAG>Y</ACTFLAG>
  <ACTFLAG>I</ACTFLAG>
  <RESERVEDTE>JB</RESERVEDTE>
  <RESERVEDTE>D</RESERVEDTE>
  <LANGUFLAG>X</LANGUFLAG>
  *##WARN_OK*
  <AUTOSUGGEST>X</AUTOSUGGEST>
  <FUZZY_SIMILARITY>0.8</FUZZY_SIMILARITY>
  <ACTFLAG>U</ACTFLAG>
  <ACTFLAG>V</ACTFLAG>
```

## Optional / legacy

XYplorer:

```text
Tree/List -> Expand tree nodes on single-click
Select items: links, desktop, user, recycle, network, hidden
Rename -> Hide extension from rename edit box
Mouse -> Single-click to open item
Startup & Exit -> Allow multiple instances: Off
Shell integration -> XYplorer in shell context menu
```

LibreOffice:

```text
Tools -> Options -> Application colors -> System theme
```

Groupy:

```text
Visual -> Tabs -> Do not show close button on tabs ever
Settings -> Prevent accidental grouping -> Instantly group windows
Application grouping -> Automatically group identical windows unless in another group
```
