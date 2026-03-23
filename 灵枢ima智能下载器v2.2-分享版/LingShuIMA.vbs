' 灵枢IMA智能下载器 - EXE包装器
' 使用VBS脚本包装JAR文件，模拟EXE行为

Option Explicit

On Error Resume Next

Dim objShell, objFSO, scriptPath, jarPath, javaCmd

' 创建Shell和FSO对象
Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

' 获取脚本所在目录
scriptPath = objFSO.GetParentFolderName(WScript.ScriptFullName)
jarPath = objFSO.BuildPath(scriptPath, "LingShuIMA.jar")

' 检查JAR文件是否存在
If Not objFSO.FileExists(jarPath) Then
    objShell.Popup "错误：找不到LingShuIMA.jar文件" & vbCrLf & _
                   "请确保文件在正确的目录中", 0, "灵枢IMA智能下载器", 16
    WScript.Quit 1
End If

' 构建Java命令
javaCmd = "javaw -Xmx512m -Dfile.encoding=UTF-8 -jar """ & jarPath & """"

' 执行Java命令（不显示窗口）
objShell.Run javaCmd, 0, False

' 清理对象
Set objShell = Nothing
Set objFSO = Nothing

' 退出脚本
WScript.Quit 0
