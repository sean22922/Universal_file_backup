@echo off
set backup=0
REM �H�U���ϥΪ��ܼ�
REM �`�N�I�I�I�аȥ���J�ѼơA�_�h�妸�ɵL�k���`�B�@

set "source="
REM �ƥ����ӷ���m
REM ���ݭn���ܡA�бN�᭱���ɮ׸��|�אּ�A��Steam�w�˦�m�Φs�ɦ�m
REM (�Ҧp: %ProgramFiles(x86)%\Steam\userdata\..\582010)

set "target="
REM �ƥ����s���m
REM (�Ҧp: C:\Users\%username%\Documents)

set "foldername="
REM �ƥ��D�n�ؿ��W��
REM (�Ҧp: XXX�s�ɳƥ�)

REM �ϥΪ��ܼƵ���

REM �{���}�l(�Фŭק�H�U���e)
if "%target%"=="" goto not_defined
if "%source%"=="" goto not_defined
if "%foldername%"=="" goto not_defined
REM �P�_�ѼƬO�_�w�]�w�H�M�w�O�_���D��not_defined�Ϭq�A���ܵ{�����D
echo �q�ιC���s�ɳƥ� by ��@Kuan ver1.0
echo.
REM �P�_�ƥ���Ƨ��O�_�w�g�s�b�A�s�b�ɱN���ܨϥΪ̦ۮƧ��w�s�b�F���s�b�ɱN�إ߸�Ƨ��ô��ܨϥΪ�
echo �����ƥ���Ƨ��O�_�w�s�b...
echo.
for /f "delims=." %%a in ('dir "%target%\%foldername%" /od /ad /b') do @set backup=%%a >nul
if exist "%target%" (
	echo �ƥ��ؿ���Ƨ��w�s�b�I && echo.
	) else (
	md %target%\%foldername% && echo �إ߳ƥ���Ƨ��ؿ� ...(%foldername%) && echo.
	)
REM �P�_����
REM ���ܨϥΪ̶}�l�ƥ��ô��ܥثe�s�ɼƫ�A�N�s��+1�ô��ܷs���s�ɽs��
echo �}�l�ƥ��s�ɸ�Ƨ��ܧڪ����MHW�s�ɳƥ���Ƨ���...
echo.
echo �ثe�� %backup% �Ӧs��... 
set /A backup=%backup%+1 
echo ���b�إ߲� %backup% �Ӧs��(�إ߮ɶ� %date:/=-% %time::=-% )...
echo.
REM ���ܵ���
REM �}�l�ƻs
xcopy /E /S /Y /F "%source%" "%target%\%foldername%\%backup%. %date:/=-% %time::=-%\"
if %errorlevel% EQU 4 (
	echo �ƥ����ѡI �нT�w�ѼƬO�_�]�w���T�I
	) else (
	echo �ƥ����\�I
	)
echo.
REM �ƻs����
echo ���U���N��H�h�X...
pause >nul
exit
:not_defined
echo �ܼƥ��]�w�I�妸�ɤw���_
echo.
pause
exit
REM �{�������A���ܨϥΪ̰h�X