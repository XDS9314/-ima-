@echo off
chcp 65001 >nul
echo ========================================
echo 灵枢IMA智能下载器V2.2 - 一键打包
echo ========================================
echo.

REM 步骤1: 打包JAR
echo [步骤 1/4] 打包JAR文件...
call package_jar.bat
if %errorlevel% neq 0 (
    echo [ERROR] JAR打包失败
    pause
    exit /b 1
)
echo.

REM 步骤2: 尝试生成EXE
echo [步骤 2/4] 尝试生成EXE文件...
call package_exe.bat
if %errorlevel% neq 0 (
    echo [警告] EXE生成失败，将使用JAR文件
    echo 请手动下载Launch4j并运行package_exe.bat
) else (
    echo EXE文件生成成功
)
echo.

REM 步骤3: 创建桌面快捷方式
echo [步骤 3/4] 创建桌面快捷方式...
call create_shortcut.bat
if %errorlevel% neq 0 (
    echo [警告] 快捷方式创建失败
) else (
    echo 快捷方式创建成功
)
echo.

REM 步骤4: 创建使用说明
echo [步骤 4/4] 创建使用说明...
echo 灵枢IMA智能下载器V2.2 - 使用说明 > 使用说明.txt
echo ======================================== >> 使用说明.txt
echo. >> 使用说明.txt
echo 【运行方式】 >> 使用说明.txt
echo. >> 使用说明.txt
echo 方式1（推荐）：双击桌面快捷方式"灵枢IMA智能下载器" >> 使用说明.txt
echo 方式2：双击 LingShuIMA.exe（如果存在） >> 使用说明.txt
echo 方式3：双击 run_jar.bat（不显示CMD窗口） >> 使用说明.txt
echo 方式4：双击 LingShuIMA.jar（需要Java环境） >> 使用说明.txt
echo. >> 使用说明.txt
echo 【系统要求】 >> 使用说明.txt
echo. >> 使用说明.txt
echo - Windows 7/8/10/11 >> 使用说明.txt
echo - Java 8或更高版本（如果使用JAR文件） >> 使用说明.txt
echo - 网络连接 >> 使用说明.txt
echo. >> 使用说明.txt
echo 【文件说明】 >> 使用说明.txt
echo. >> 使用说明.txt
echo - LingShuIMA.exe: 独立可执行文件（推荐使用） >> 使用说明.txt
echo - LingShuIMA.jar: Java可执行文件 >> 使用说明.txt
echo - run_jar.bat: 运行JAR的批处理文件（不显示CMD） >> 使用说明.txt
echo - dist\: 包含所有依赖和资源的目录 >> 使用说明.txt
echo - downloads\: 下载文件保存目录 >> 使用说明.txt
echo - logs\: 日志文件目录 >> 使用说明.txt
echo. >> 使用说明.txt
echo 【注意事项】 >> 使用说明.txt
echo. >> 使用说明.txt
echo 1. 首次运行需要Java环境（如果使用JAR文件） >> 使用说明.txt
echo 2. 下载的文件保存在downloads目录 >> 使用说明.txt
echo 3. 日志文件保存在logs目录 >> 使用说明.txt
echo 4. 如果EXE文件无法运行，请使用run_jar.bat >> 使用说明.txt
echo. >> 使用说明.txt
echo 【技术支持】 >> 使用说明.txt
echo. >> 使用说明.txt
echo 作者：灵枢 >> 使用说明.txt
echo 版本：V2.2 >> 使用说明.txt
echo. >> 使用说明.txt

echo 使用说明创建完成
echo.

echo ========================================
echo 一键打包完成！
echo ========================================
echo.
echo 生成的文件：
if exist "LingShuIMA.exe" (
    echo [√] LingShuIMA.exe - 独立可执行文件（推荐）
)
if exist "LingShuIMA.jar" (
    echo [√] LingShuIMA.jar - Java可执行文件
)
if exist "run_jar.bat" (
    echo [√] run_jar.bat - 运行脚本（不显示CMD）
)
echo [√] 使用说明.txt - 详细使用说明
echo [√] 桌面快捷方式 - 灵枢IMA智能下载器
echo.
echo dist目录包含：
echo - lib\ 依赖库
echo - config\ 配置文件
echo - icon\ 图标文件
echo - downloads\ 下载目录
echo - logs\ 日志目录
echo.
echo 现在您可以：
echo 1. 双击桌面快捷方式运行软件
echo 2. 或者双击 LingShuIMA.exe 运行
echo 3. 或者双击 run_jar.bat 运行
echo.
pause
