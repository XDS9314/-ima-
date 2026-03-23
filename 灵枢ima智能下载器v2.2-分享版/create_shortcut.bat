@echo off
chcp 65001 >nul
echo ========================================
echo 创建桌面快捷方式
echo ========================================
echo.

REM 检查EXE文件是否存在
if exist "LingShuIMA.exe" (
    set "TARGET_FILE=LingShuIMA.exe"
    set "TARGET_NAME=灵枢IMA智能下载器"
) else if exist "LingShuIMA.jar" (
    set "TARGET_FILE=run_jar.bat"
    set "TARGET_NAME=灵枢IMA智能下载器"
) else (
    echo [ERROR] 未找到可执行文件
    echo 请先运行 package_jar.bat 或 package_exe.bat
    pause
    exit /b 1
)

REM 获取当前目录的绝对路径
set "CURRENT_DIR=%~dp0"
set "CURRENT_DIR=%CURRENT_DIR:~0,-1%"

REM 创建PowerShell脚本
echo $WshShell = New-Object -ComObject WScript.Shell > create_shortcut.ps1
echo $Shortcut = $WshShell.CreateShortcut("%USERPROFILE%\Desktop\%TARGET_NAME%.lnk") >> create_shortcut.ps1
echo $Shortcut.TargetPath = "%CURRENT_DIR%\%TARGET_FILE%" >> create_shortcut.ps1
echo $Shortcut.WorkingDirectory = "%CURRENT_DIR%" >> create_shortcut.ps1
echo $Shortcut.Description = "灵枢IMA智能下载器 - 知识库文件批量下载工具" >> create_shortcut.ps1
echo $Shortcut.IconLocation = "%CURRENT_DIR%\icon\icon_256.ico" >> create_shortcut.ps1
echo $Shortcut.Save() >> create_shortcut.ps1

REM 执行PowerShell脚本
echo 正在创建桌面快捷方式...
powershell -ExecutionPolicy Bypass -File create_shortcut.ps1

REM 清理临时文件
del /f /q create_shortcut.ps1 >nul 2>&1

echo.
echo ========================================
echo 桌面快捷方式创建完成！
echo ========================================
echo.
echo 快捷方式已创建到桌面：%TARGET_NAME%
echo.
pause
