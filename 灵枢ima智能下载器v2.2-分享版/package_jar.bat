@echo off
chcp 65001 >nul
echo ========================================
echo 打包灵枢IMA智能下载器V2.2
echo ========================================
echo.

REM 清理旧的打包文件
echo [1/6] 清理旧的打包文件...
if exist "dist" rmdir /s /q dist
if exist "LingShuIMA.jar" del /f /q LingShuIMA.jar
echo 清理完成
echo.

REM 创建必要的目录
echo [2/6] 创建打包目录...
mkdir dist\lib
mkdir dist\config
mkdir dist\icon
mkdir dist\downloads
mkdir dist\logs
echo 目录创建完成
echo.

REM 编译Java源文件
echo [3/6] 编译Java源文件...
javac -encoding UTF-8 -cp "lib\*;config" -d dist ^
    src\com\lingshu\ima\config\*.java ^
    src\com\lingshu\ima\dto\*.java ^
    src\com\lingshu\ima\dto\helper\*.java ^
    src\com\lingshu\ima\service\*.java ^
    src\com\lingshu\ima\ui\UnifiedMainFrame.java ^
    src\com\lingshu\ima\Main.java ^
    src\com\lingshu\ima\UnifiedMain.java

if %errorlevel% neq 0 (
    echo [ERROR] 编译失败
    pause
    exit /b 1
)
echo 编译完成
echo.

REM 复制资源文件
echo [4/6] 复制资源文件...
copy /Y "config\*.properties" "dist\config\" >nul 2>&1
copy /Y "icon\*.png" "dist\icon\" >nul 2>&1
copy /Y "icon\*.ico" "dist\icon\" >nul 2>&1
copy /Y "lib\*.jar" "dist\lib\" >nul 2>&1
echo 资源文件复制完成
echo.

REM 创建JAR文件
echo [5/6] 创建JAR文件...
cd dist
jar cfm ..\LingShuIMA.jar ..\MANIFEST.MF -C . .
cd ..
if %errorlevel% neq 0 (
    echo [ERROR] JAR创建失败
    pause
    exit /b 1
)
echo JAR文件创建完成
echo.

REM 复制JAR到dist目录
echo [6/6] 复制JAR文件...
copy /Y "LingShuIMA.jar" "dist\" >nul 2>&1
echo 复制完成
echo.

echo ========================================
echo 打包完成！
echo ========================================
echo.
echo 生成的文件：
echo - LingShuIMA.jar (可执行JAR文件)
echo - dist\ 目录 (包含所有依赖和资源)
echo.
echo 使用方法：
echo 方法1: 双击 LingShuIMA.jar 运行
echo 方法2: 使用 run_jar.bat 运行（不显示CMD窗口）
echo 方法3: 使用 package_exe.bat 生成EXE文件
echo.
pause
