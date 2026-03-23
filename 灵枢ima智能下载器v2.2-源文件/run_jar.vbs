Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "javaw -Xmx512m -jar LingShuIMA.jar", 0, False
Set WshShell = Nothing
