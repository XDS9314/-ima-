@echo off
chcp 65001 >nul
echo ========================================
echo 使用Launch4j生成EXE文件
echo ========================================
echo.

REM 检查LingShuIMA.jar是否存在
if not exist "LingShuIMA.jar" (
    echo [ERROR] LingShuIMA.jar 不存在
    echo 请先运行 package_jar.bat 创建JAR文件
    pause
    exit /b 1
)

REM 检查Launch4j是否已安装
echo [1/4] 检查Launch4j...
if exist "launch4j\launch4jc.exe" (
    echo Launch4j已安装
) else (
    echo Launch4j未安装，正在下载...
    if not exist "launch4j.zip" (
        echo 正在下载Launch4j...
        powershell -Command "Invoke-WebRequest -Uri 'https://sourceforge.net/projects/launch4j/files/launch4j-3/3.14/launch4j-3.14-win32.zip/download' -OutFile 'launch4j.zip'"
        if %errorlevel% neq 0 (
            echo [ERROR] 下载失败
            echo 请手动下载Launch4j: https://sourceforge.net/projects/launch4j/
            pause
            exit /b 1
        )
    )
    echo 正在解压Launch4j...
    powershell -Command "Expand-Archive -Path 'launch4j.zip' -DestinationPath '.' -Force"
    if %errorlevel% neq 0 (
        echo [ERROR] 解压失败
        pause
        exit /b 1
    )
    echo Launch4j安装完成
)
echo.

REM 检查配置文件
echo [2/4] 检查配置文件...
if not exist "launch4j_config.xml" (
    echo [ERROR] launch4j_config.xml 不存在
    pause
    exit /b 1
)
echo 配置文件存在
echo.

REM 使用Launch4j生成EXE
echo [3/4] 生成EXE文件...
launch4j\launch4jc.exe launch4j_config.xml
if %errorlevel% neq 0 (
    echo [ERROR] EXE生成失败
    pause
    exit /b 1
)
echo EXE文件生成完成
echo.

REM 复制EXE到dist目录
echo [4/4] 复制EXE文件...
if exist "dist" (
    copy /Y "LingShuIMA.exe" "dist\" >nul 2>&1
    echo EXE文件已复制到dist目录
)
echo.

echo ========================================
echo EXE生成完成！
echo ========================================
echo.
echo 生成的文件：
echo - LingShuIMA.exe (独立可执行文件)
echo.
echo 使用方法：
echo 直接双击 LingShuIMA.exe 即可运行
echo.
pause
