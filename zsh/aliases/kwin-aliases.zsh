#!/bin/zsh

# --------------------------------------------------------
# KWin Configuration and Meta Key
# --------------------------------------------------------
alias metareload="qdbus org.kde.KWin /KWin reconfigure"
alias metalist="qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.shortcutNames"
alias metakrunner='kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.krunner,/App,,toggleDisplay" && metareload'
alias metalauncher='kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.plasmashell,/PlasmaShell,org.kde.PlasmaShell,activateLauncherMenu" && metareload'
alias metaexposeall='kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.kglobalaccel,/component/kwin,org.kde.kglobalaccel.Component,invokeShortcut,ExposeAll" && metareload'
alias metadisable='kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "" && metareload'
alias metaoverview='kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.kglobalaccel,/component/kwin,org.kde.kglobalaccel.Component,invokeShortcut,Overview" && metareload'

