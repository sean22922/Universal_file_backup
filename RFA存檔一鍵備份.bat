@ECHO off
set backup=0
REM 以下為使用者變數
REM 注意！！！請務必填入參數，否則批次檔無法正常運作

set "source=%localappdata%\Remant\Saved\SaveGames"
REM 備份的來源位置
REM 有需要的話，請將後面的檔案路徑改為你的Steam安裝位置及存檔位置
REM (預設值: %localappdata%\Remant\Saved\SaveGames)

set "target=%userprofile%\Documents"
REM 備份的存放位置
REM (預設值: %userprofile%\Documents)

set "foldername=RFA存檔備份"
REM 備份主要目錄名稱
REM (預設值: RFA存檔備份)

REM 使用者變數結束

REM 程式開始(請勿修改以下內容)
if "%target%"=="" goto not_defined
if "%source%"=="" goto not_defined
if "%foldername%"=="" goto not_defined
REM 判斷參數是否已設定以決定是否跳躍至not_defined區段，提示程式標題
echo RFA存檔一鍵備份 by 關@Kuan ver1.0
echo.
REM 判斷備份資料夾是否已經存在，存在時將提示使用者自料夾已存在；不存在時將建立資料夾並提示使用者
echo 偵測備份資料夾是否已存在...
echo.
for /f "delims=." %%a in ('dir "%target%\%foldername%" /od /ad /b') do @set backup=%%a >nul
if exist "%target%" (
	echo 備份目錄資料夾已存在！ && echo.
	) else (
	md %target%\%foldername% && echo 建立備份資料夾目錄 ...(%foldername%) && echo.
	)
REM 判斷結束
REM 提示使用者開始備份並提示目前存檔數後，將編號+1並提示新的存檔編號
echo 開始備份存檔資料夾至我的文件的MHW存檔備份資料夾中...
echo.
echo 目前有 %backup% 個存檔... 
set /A backup=%backup%+1 
echo 正在建立第 %backup% 個存檔(建立時間 %date:/=-% %time::=-% )...
echo.
REM 提示結束
REM 開始複製
xcopy /E /S /Y /F "%source%" "%target%\%foldername%\%backup%. %date:/=-% %time::=-%\"
if %errorlevel% EQU 4 (
	echo 備份失敗！ 請確定參數是否設定正確！
	) else (
	echo 備份成功！
	)
echo.
REM 複製結束
echo 按下任意鍵以退出...
pause >nul
exit
:not_defined
echo 變數未設定！批次檔已中斷
echo.
pause
exit
REM 程式結束，提示使用者退出
