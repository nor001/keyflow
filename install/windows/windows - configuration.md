# ESCENCIAL

## windows  
  settings ->
    system ->
      multitasking  -> alt-tab(open windows only)
      <!--shared experiences -> (off)-->
    device ->
      typing        -> advanced keyboard settings -> input language hot keys -> set none
      mouse         -> primary button(right), mouse pointer speed(max)
    personalization ->
      colors        -> darkmode, transparent effects (off)
      <!--taskbar   -> (off): task, widgets, chat, multiple displays-->
    time & language ->
      language      -> english
      region        ->
        Windows display language -> EN
        Preferred   -> EN us
        Regional    -> Peru
        Administrative language settings -> Formats -> Adittional settings -> decimal "." list separator "," Metros
    <!--gaming
      game mode     -> (off)
    easy of access
      display       -> (off) all-->
    search ->
      permissions & -> (off) all
      searching win -> advanced search indexer settings
    <!--privacy
      general       -> (off) all
      inking & typi -> (off) all
      diagnostics   -> required diagnostic data
      activity hist -> (off) all
    update & security
      delivery opti -> (off): allow downloads from other PCs
      panel control -> turn windows features -> subsystem for linux-->
  
  edit the system environment variables ->
    performace ->
      custom ->
        show window contents while dragging
        smoth edges of screen fonts

## backup
  downloads\.sync -> usb\..sync_with_folder_download

## shell:startup
  crear kur_app.lnk
  crear c:\temp\ym.lnk

## xyplorer
  general ->
    tree and list   -> tree         -> expand tree nodes on single-click
                      select items  -> links, desktop, user, recycle, network, hidden
    sort and rename -> rename-> hide extension from rename edit box
    menus, mouse, u -> mouse -> single-click to open an item
    startup & Exit  -> allow multiple instances -> off
  
  shell integration -> xyplorer in shell context menu

## everything
  view -> (off) menu bar
  add column "run count" and move to first -> descending
  ctrl+p ->
    general ->
      fonts and colors ->
        item  -> search edit -> size 13
              -> result list -> size 10
      keyboard-> show windows hotkey -> alt + space
    indexes -> ntfs -> (off) automatically include new fixed volumes
    folders -> E:\,F:\,S:\,W:\
    content -> index file content on -> add *.md
    exclude -> (on) exclude list -> add filter -> one by one -> (.*,*node_modules*)
    advanced -> (on)  -> close_on_deactivate, show_window_on_monitor_from_cursor
             -> (off) -> alpha_instance

## keepassxc
  settings ->
    general ->
      auto-type -> global auto-type shortcut -> ^!F1
      basic settings -> user interface ->
        minimize instead of app exit
        show a system tray icon ->
          hide windows to system tray when minimized
    security ->
      use duckduckgo service to download website icons
    browser integration -> 
      general -> Firefox (on)
      advanced -> allow using localhost with passkeys (on)
  
### keepassxc web
  options ->
    automatically fill in single-credential entries
    automatically fill in single TOTP entries
    automatically fill HTTP basic auth credentials
    save domain only
    download favicon after save
    enable passkey
    https://keepassxc.org/docs/#faq-browser-string-fields

## snipaste
  preference -> control -> snip  -> prtsc -> desactivar los demas

## sharex
  application settings -> general -> minimize to tray on start (on)
  hotkey settings -> start/stop screen recording (GIF) -> ctrl + prtsc

## firefox
  https://github.com/yokoffing/Betterfox
  https://github.com/yokoffing/filterlists

## office
  word -> vba
  excel -> vba
  outlook ->
    view -> change view -> create view NTP copy of single -> 
            columns(importance,attachment,from,to,subject,received,categories,mention)
    options -> mail -> signatures
    favorites -> (bandeja de entrada, elementos enviados, archivo, elementos eliminados)

## notepad++
  extension -> compareplus, jstool, xml tools
  language  -> user defined language -> open user defined languages folder -> copy abap
  settings  -> preferences -> dark mode -> follow windows
                            auto-completion -> (on) auto-completion on each input
                            language -> tab size 2
              import -> import style theme -> dracula
              style configurator
                theme dracula
                dejavu sans mono
                font size 9
                (on) global font
                (on) global font size

## sublime
  tools -> install package control
  preferences -> package control -> install package -> abap, dracula color scheme
              -> select color scheme -> dracula
              -> settings
  {
    "font_face": "dejavu sans mono",
    "font_size": 10,
    "caret_extra_bottom": 0,
    "caret_extra_top": 0,
    "scroll_speed": 0
  }
              -> key bindings
  { "keys": ["alt+j"], "command": "text_highlighter_toggle" },
  { "keys": ["ctrl+alt+j"], "command": "text_highlighter_clear_all" }

## saplogon
  opciones ->
    diseño interactivo ->
      visualizacion 1 -> (visualizar clave en listas desplegables)
      visualizacion 2
        (visualizar nombre de sistema en la bandeja de sistema)
        (llamar busqueda ampliada mediante acceso rapido)
    datos locales -> historial -> (activar historial para campos hasta -> 255)
    seguridad     -> configura -> (off)
    opciones de sap logon ->
      idioma ES
      fichero configuration -> ejecutar "mini sap- sync backup to local.ahk"

## eclipse
  help  -> install new software -> https://tools.hana.ondemand.com/latest
           eclipse user storage -> open marketplace favorite -> github copilot
  
  window -> preferences ->
    general ->
      appearance ->
        color and fonts ->
          abap          -> 
            syntax coloring
              comment     ->  98 114 164
              identifier  -> 248 248 242
              keyword     -> 255 121 198
              literal     -> 241 250 111
              number liter-> 189 147 249
          basic -> text font -> dejavu sans mono 9
      editors -> text editors -> displayed tab width -> 2
                              -> spelling (off)
      keys -> open sap gui for object ^+6
    
    abap development ->
      editors -> 
        source code editors ->
            automatically close brackets and literals (off)
          code completion ->
            always insert full signature (on)
            also suggest non-keywords (on)
            
## flow.launcher
  Plugins ->
    Browser bookmarks       -> firefox
    Explorer ->
      Index Search Engine   -> Everything
      Content Search Engine -> Everything
      Directory Recursive...-> Everything
  Appearance ->
    Animation -> off
    Sound Effect -> off

## libreoffice
  tools -> options -> application colors -> system theme

## pdfxchange
  toolbar -> (home, comment)
  preferences
    page display -> default page layout(two pages continuos, 90%)
    accessibility-> crear Norman_gris( page background color -> light gray )
    customize ui -> allow dark mode from system

## winmerge
  view -> select font -> dejavu sans mono 9

## docFetcher
  index -> abap_src

## beyond_compare
  options ->
    colors, fonts -> default text -> consolas 9
    toolbars, etc. ->
      home -> only active(minor,rules,compare,expand,full refresh,swap)
      text compare ->
        copy to left      -> alt + left
        copy to right     -> alt + right
        ignored           -> alt + i
        next diffe files  -> alt + pgdn
        next diffe section-> alt + down
        previous dif files-> alt + pgup
        previous dif secti-> alt + up
  rules
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

## groupy
  visual                -> how should the tabs look? -> do not show a close button on the tabs ever
  settings              -> you can prevent accidental grouping by delaying group creation -> instanly group windows
  application grouping  -> automatically group identical windows together unles in another group

## f.lux
  options       -> features and notificacions -> (off) (use these hotkeys to control f.lux)
  custom color  -> classic f.lux -> 5200