#hotif winactive("ahk_group group_vscode_editors")
+f1::{
trackEditorsHotkeyUsage("+f1", "vscode-group")
Send("^+o")
}
!f1::{
trackEditorsHotkeyUsage("!f1", "vscode-group")
services.dynamic.openEditorCommandPaletteWithPercent()
}
^f1::{
trackEditorsHotkeyUsage("^f1", "vscode-group")
Send("^+p")
}

