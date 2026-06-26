# keyflow smoke test (manual)

## 1) Arranque

### 1.1 Comando con ejecutable bundled

```powershell
$proc = Start-Process -FilePath 'platforms/windows/tools/exe/autohotkey64.exe' `
    -ArgumentList '/ErrorStdOut', 'platforms/windows/keyflow.ahk' `
    -PassThru -RedirectStandardError 'ahk_stderr.txt' -NoNewWindow
Start-Sleep -Seconds 3
$proc.Kill()
Get-Content 'ahk_stderr.txt' -ErrorAction SilentlyContinue
```

Si `ahk_stderr.txt` queda vacío el arranque es limpio.

### 1.2 Criterios
- No hay errores de `#Include`.
- No hay mensajes de variable o función no encontrada.
- `keyflowInitServices()` no lanza dialog de error al registrar servicios.

## 2) Hotkeys globales
- Probar `!e`, `!a`, `!s`, `!d`, `!f` (window groups).
- Probar `#f1/#f2/#f3` (SAP sessions) si aplica.
- Probar `#esc`, `#!left`, `#!right`.

## 3) Hotstrings
- Confirmar que `autocorrect` y `quick-snippets` aplican en un editor.
- Confirmar que perfiles SAP (`sap-transaction-shortcuts`, `ymt-commands`) aplican en el contexto esperado.

## 4) SAP (si aplica)
- Abrir sesión dev/qas/prd.
- Ejecutar un tcode desde SAP GUI.
- Verificar comportamiento en Eclipse (object open/search) si se usa.

## 5) KeePass provider (si aplica)
- Forzar un fallo controlado (provider no disponible) y validar que el error sea legible.
