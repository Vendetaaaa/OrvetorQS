:::|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|
:::|   Name: OrvetorQS                                                                                      |
:::|   Copyright: Vendezela 2026 (c) — All right reserved                                                   |
:::|   Author: Vendetaaaa                                                                                   |
:::|   Organization: Vendezela Org                                                                          |
:::|   Program's Time & Creation:  10:07:56 PM — 13/8/2025 (format: DD|MM|YYYY)                             |
:::|   Contact:                                                                                             |
:::|      → Email: VZVendeta@hotmail.com                                                                    |
:::|      → Github: Vendetaaaa                                                                              |
:::|   For further information, check Contact, README.md, and LICENSE                                       |
:::|                                                                                                        |
:::|________________________________________________________________________________________________________|










:: --------------- Before Entry ---------------
@echo off
title OrvetorQS
setlocal EnableExtensions EnableDelayedExpansion

:: --------------- Globals ---------------
set "ROOT_DIR=%USERPROFILE%\OQS"
set "CONFIGURATION_FILE=%ROOT_DIR%\Configuration.ini"
set "APPDATA_DIR=%ROOT_DIR%\AppData"
set "LANGUAGES_DIR=%ROOT_DIR%\Languages"
set "LANGUAGE_1_FILE=%LANGUAGES_DIR%\Lang1.lang"
set "LANGUAGE_2_FILE=%LANGUAGES_DIR%\Lang2.lang"
set "LANGUAGE_3_FILE=%LANGUAGES_DIR%\Lang3.lang"
set "LANGUAGE_4_FILE=%LANGUAGES_DIR%\Lang4.lang"
set "LANGUAGE_5_FILE=%LANGUAGES_DIR%\Lang5.lang"

set "DOCUMENTS_DIR=%ROOT_DIR%\Documents"
set "README_FILE=%DOCUMENTS_DIR%\ReadMe.txt"
set "LICENSE_FILE=%DOCUMENTS_DIR%\License.txt"
set "CONTACT_FILE=%DOCUMENTS_DIR%\Contact.txt"
set "CREDITS_FILE=%DOCUMENTS_DIR%\Credits.txt"

set "DATA_DIR=%APPDATA_DIR%\Data"
set "LOG_DIR=%APPDATA_DIR%\Logs"
set "TEMPORARY_DIR=%APPDATA_DIR%\TemporaryFiles"

set "LOG_FILE=%LOG_DIR%\OQS.log"
set "CRASH_FLAG=%LOG_DIR%\Crash.flag"
set "CRASH_LOG=%LOG_DIR%\Crash.log"
set "ERROR_LOG=%LOG_DIR%\Error.log"

set "OPERATIONS_DIR=%DATA_DIR%\Operations"
set "BUGS_AND_FIXES_DIR=%OPERATIONS_DIR%\BugsAndFixes"
set "BUGS_AND_FIXES_FILE=%BUGS_AND_FIXES_DIR%\BugsAndFixes.log"
set "INSTALL_FILE=%OPERATIONS_DIR%\Install.log"
set "UPDATE_FILE=%OPERATIONS_DIR%\Update.log"
set "CACHES_FILE=%OPERATIONS_DIR%\Caches"

set "PROFILE_DIR=%ROOT_DIR%\Profile"
set "USER_DIR=%PROFILE_DIR%\User"
set "USER_PROFILE_FILE=%PROFILE_DIR%\UserProfile.txt"

set "ABOUT_ALL_DIR=%ROOT_DIR%\AboutUs"
set "ABOUT_AUTHOR_FILE=%ROOT_DIR%\AboutAuthor.txt"
set "ABOUT_ORG_FILE=%ROOT_DIR%\AboutOrganization.txt"

set "OQS_ASSURANCE_FF=%ROOT_DIR%\OQS_Assurance"

set "OQS_ASSURANCE_FLAG_1=%ROOT_DIR%\OQS_Assurance_complete_successfully"
set "OQS_ASSURANCE_FLAG_2=%ROOT_DIR%\OQS_Assurance_complete_unsuccessfully"

set "USER_HOME=%USERPROFILE%"
REM USERDOMAIN and USERNAME are already set by Windows — no need to re-assign them
for /f "tokens=2,* delims= " %%A in ('wmic useraccount where "name='%USERNAME%'" get fullname /value ^| find "="') do (
    set "USER_FULLNAME=%%B"
)
set "USER_SHORTCUTS=%APPDATA%\Microsoft\Windows\Start Menu\Programs"

set "USER_FAVORITES=%USERPROFILE%\Favorites"

set "USER_AVATAR=%APPDATA%\Microsoft\Windows\AccountPictures"

set "COMMAND_GUIDE_FILE=%ROOT_DIR%\Command_Guide.txt"

set "APP_NAME=OrvetorQS"
set "APP_VERSION=1.0 Alpha"
set "BASE_DIR=%~dp0"
set "COLOR=03"
set "DEFAULT_COLOR=03"
set "bg=0"
set "fg=3"

net session >nul 2>&1
if %errorlevel% neq 0 (
  set "ISADMIN=OFF"
  chcp 65001 >nul
    echo   .d88888b.                            888                          .d88888b.    .d8888b.  
    echo  d88P   Y88b                           888                         d88P   Y88b  d88P  Y88b 
    echo  888     888                           888                         888     888  Y88b.   8b  
    echo  888     888 888d888 888  888  .d88b.  888888 .d88b.  888d888      888     888     888b. 
    echo  888     888 888P    888  888 d8P  Y8b 888   d88  88b 888P         888     888       Y88b. 
    echo  888     888 888     Y88  88P 88888888 888   888  888 888          888 Y8b 888        888 
    echo  Y88b. .d88P 888      Y8bd8P  Y8b.     Y88b. Y88..88P 888          Y88b.Y8b88P  Y88b  d88P 
    echo    Y88888P   888       Y88P     Y8888    Y888  Y88P   888            Y88888     dYY8888   
    echo                                                                          Y88b    d88b       
    echo                                                                              Yd88b 
    echo.
    echo.
    echo.
    echo.
    echo WARNING     Not running as Administrator     WARNING
    echo To run this program as ADMIN, right-click the batch file and choose to "Run as administrator"
    echo.
    echo.
    echo.
    echo  ^>Some features require elevated permissions to work properly and to have full functionality.
    echo  ^>Highly recommended to access the README and COPYRIGHT files before using OrvetorQS.
    echo  ^>For further information, contact the owner of this tool.
    echo  ^>For a better experience, please use this program in fullscreen mode and zoom as much as its needed.
    echo.
    echo.
    echo Press any key to continue...
    pause >nul
) else (
  set "ISADMIN=ON"
)




:: --------------- Bootstrap ---------------
if not exist "%ROOT_DIR%" mkdir "%ROOT_DIR%" >nul 2>&1
if not exist "%APPDATA_DIR%" mkdir "%APPDATA_DIR%" >nul 2>&1
if not exist "%DOCUMENTS_DIR%" mkdir "%DOCUMENTS_DIR%" >nul 2>&1
if not exist "%DATA_DIR%" mkdir "%DATA_DIR%" >nul 2>&1
if not exist "%LOG_DIR%" mkdir "%LOG_DIR%" >nul 2>&1
if not exist "%TEMPORARY_DIR%" mkdir "%TEMPORARY_DIR%" >nul 2>&1
if not exist "%OPERATIONS_DIR%" mkdir "%OPERATIONS_DIR%" >nul 2>&1
if not exist "%BUGS_AND_FIXES_DIR%" mkdir "%BUGS_AND_FIXES_DIR%" >nul 2>&1
if not exist "%PROFILE_DIR%" mkdir "%PROFILE_DIR%" >nul 2>&1
if not exist "%USER_DIR%" mkdir "%USER_DIR%" >nul 2>&1
if not exist "%LANGUAGES_DIR%" mkdir "%LANGUAGES_DIR%" >nul 2>&1
if not exist "%ABOUT_ALL_DIR%" mkdir "%ABOUT_ALL_DIR%" >nul 2>&1
if not exist "%DATA_DIR%\Backups" mkdir "%DATA_DIR%\Backups" >nul 2>&1

if not exist "%CONFIGURATION_FILE%" (
    echo DO NOT DELETE THIS FILE!>"%CONFIGURATION_FILE%"
    echo.>>"%CONFIGURATION_FILE%"
    echo ; Configuration OQS>>"%CONFIGURATION_FILE%"
    echo.>>"%CONFIGURATION_FILE%"
    echo General>>"%CONFIGURATION_FILE%"
    echo.>>"%CONFIGURATION_FILE%"
    echo app_name=OrvetorQS>>"%CONFIGURATION_FILE%"
    echo version=1.1.1 Ultra Alpha>>"%CONFIGURATION_FILE%"
    echo language=English>>"%CONFIGURATION_FILE%"
    echo theme=default>>"%CONFIGURATION_FILE%"
    echo log_level=INFO>>"%CONFIGURATION_FILE%"
    echo.>>"%CONFIGURATION_FILE%"
    echo User>>"%CONFIGURATION_FILE%"
    echo.>>"%CONFIGURATION_FILE%"
    echo username=%USERNAME%>>"%CONFIGURATION_FILE%"
    echo last_login=%DATE% %TIME%>>"%CONFIGURATION_FILE%"
    echo recent_file1=%USERPROFILE%\Documents\file1.txt>>"%CONFIGURATION_FILE%"
    echo recent_file2=%USERPROFILE%\Documents\file2.txt>>"%CONFIGURATION_FILE%"
    echo.>>"%CONFIGURATION_FILE%"
    echo Backup>>"%CONFIGURATION_FILE%"
    echo.>>"%CONFIGURATION_FILE%"
    echo auto_backup=true>>"%CONFIGURATION_FILE%"
    echo backup_time=02:00>>"%CONFIGURATION_FILE%"
    echo backup_source=%USERPROFILE%\Documents>>"%CONFIGURATION_FILE%"
    echo backup_target=%DATA_DIR%\Backups>>"%CONFIGURATION_FILE%"
    echo keep_count=5>>"%CONFIGURATION_FILE%"
    echo.>>"%CONFIGURATION_FILE%"
    echo Features>>"%CONFIGURATION_FILE%"
    echo.>>"%CONFIGURATION_FILE%"
    echo temp_cleanup=true>>"%CONFIGURATION_FILE%"
    echo admin_required=false>>"%CONFIGURATION_FILE%"
    echo export_enabled=true>>"%CONFIGURATION_FILE%"
    echo import_enabled=true>>"%CONFIGURATION_FILE%"
    echo.>>"%CONFIGURATION_FILE%"
    echo Paths>>"%CONFIGURATION_FILE%"
    echo.>>"%CONFIGURATION_FILE%"
    echo data_dir=%DATA_DIR%>>"%CONFIGURATION_FILE%"
    echo log_dir=%LOG_DIR%>>"%CONFIGURATION_FILE%"
    echo temp_dir=%TEMPORARY_DIR%>>"%CONFIGURATION_FILE%"
    echo.>>"%CONFIGURATION_FILE%"
    echo Network>>"%CONFIGURATION_FILE%"
    echo.>>"%CONFIGURATION_FILE%"
    echo proxy_enabled=false>>"%CONFIGURATION_FILE%"
    echo proxy_address=>>"%CONFIGURATION_FILE%"
    echo api_key=>>"%CONFIGURATION_FILE%"
    echo.>>"%CONFIGURATION_FILE%"
    echo Security>>"%CONFIGURATION_FILE%"
    echo.>>"%CONFIGURATION_FILE%"
    echo password_hash=>>"%CONFIGURATION_FILE%"
    echo access_level=user>>"%CONFIGURATION_FILE%"
    echo.>>"%CONFIGURATION_FILE%"
    echo Advanced>>"%CONFIGURATION_FILE%"
    echo.>>"%CONFIGURATION_FILE%"
    echo max_log_size=1048576>>"%CONFIGURATION_FILE%"
    echo exclude_patterns=*.tmp;*.bak>>"%CONFIGURATION_FILE%"
    echo notify_on_complete=true>>"%CONFIGURATION_FILE%"
)

if not exist "%LICENSE_FILE%" (
    echo Definition: a license is the official permission from a governing body or a copyright holder to do, use, or own something, such as a vehicle ^(driver's license^), software, or intellectual property.>"%LICENSE_FILE%"
    echo Licenses are granted as part of an agreement and can specify the terms and conditions under which someone is allowed to use a product or service.>>"%LICENSE_FILE%"
    echo A license gives you the legal right to do something you might not otherwise be able to do.>>"%LICENSE_FILE%"
    echo It's a form of agreement between the granting party ^(licensor^) and the recipient ^(licensee^).>>"%LICENSE_FILE%"
    echo Ignoring a license can lead to fines, legal action, loss of privileges, and other serious consequences, depending on the type of license.>>"%LICENSE_FILE%"
    echo For instance, driving without a license can result in hefty fines, points on your license, potential vehicle impoundment, and even arrest.>>"%LICENSE_FILE%"
    echo Businesses operating without necessary permits face fines, lawsuits, and potential closure.>>"%LICENSE_FILE%"
    echo Copyrighted material played without a license can lead to lawsuits from rights holders.>>"%LICENSE_FILE%"
    echo IMPORTANT NOTE: As stated earlier, if any user by any means ignores everything that will be presented in this .txt file, legal action will be taken.>>"%LICENSE_FILE%"
    echo International ^& Regional Frameworks>>"%LICENSE_FILE%"
    echo 1. Berne Convention for the Protection of Literary and Artistic Works ^(1886 – 1971^)>>"%LICENSE_FILE%"
    echo Software is treated as a "literary work.">>"%LICENSE_FILE%"
    echo Provides automatic copyright protection ^(no need to register^).>>"%LICENSE_FILE%"
    echo Grants authors exclusive rights ^(reproduction, distribution, adaptation^).>>"%LICENSE_FILE%"
    echo Countries must provide remedies for infringement.>>"%LICENSE_FILE%"
    echo 2. Agreement on Trade-Related Aspects of Intellectual Property Right ^(Trips, 1994, WTO^)>>"%LICENSE_FILE%"
    echo Article 10 explicitly states that computer programs are protected as literary works under the Berne Convention.>>"%LICENSE_FILE%"
    echo Requires WTO members to ensure civil and criminal procedures for enforcement ^(injunctions, damages, seizure of infringing goods^).>>"%LICENSE_FILE%"
    echo 3. WIPO Copyright Treatment ^(WCT, 1996^)>>"%LICENSE_FILE%"
    echo Extends Berne protection specifically to digital works and software.>>"%LICENSE_FILE%"
    echo Provides exclusive rights for authors to authorize/restrict reproduction, distribution, and communication of programs.>>"%LICENSE_FILE%"
    echo Countries must implement legal remedies for violations.>>"%LICENSE_FILE%"
    echo 4. European Union>>"%LICENSE_FILE%"
    echo Directive 2009/24/EC ^(Software Directive^): Protects computer programs as literary works under copyright.>>"%LICENSE_FILE%"
    echo Prohibits unauthorized reproduction, distribution, rental, or lending.>>"%LICENSE_FILE%"
    echo Directive 2004/48/EC ^(Enforcement Directive^): Provides rights holders the ability to seek injunctions, damages, and destruction of infringing copies.>>"%LICENSE_FILE%"
    echo 5. WIPO Performances and Phonograms Treatment ^(WPPT, 1996^)>>"%LICENSE_FILE%"
    echo Complements the WCT.>>"%LICENSE_FILE%"
    echo Protects digital content and software-related works from unauthorized use, especially in online environments.>>"%LICENSE_FILE%"
    echo Grants authors exclusive rights and enforcement measures.>>"%LICENSE_FILE%"
    echo Across all these frameworks and laws, remedies for software theft or copyright violation usually include:>>"%LICENSE_FILE%"
    echo Civil Remedies:>>"%LICENSE_FILE%"
    echo Injunctions ^(stop the infringement^).>>"%LICENSE_FILE%"
    echo Monetary damages ^(actual or statutory^).>>"%LICENSE_FILE%"
    echo Seizure/destruction of infringing goods.>>"%LICENSE_FILE%"
    echo Criminal Remedies ^(in cases of willful infringement, piracy, or large-scale commercial theft^):>>"%LICENSE_FILE%"
    echo Fines.>>"%LICENSE_FILE%"
    echo Imprisonment.>>"%LICENSE_FILE%"
    echo By accessing the batch file through any means ^(downloading, copying the code and make it as your own^), you, as the user, accept the consequences if you commit theft.>>"%LICENSE_FILE%"
    echo In a summary, you may edit, copy, share, improve as you please, but you cannot make claim yourself the original author or make any statement as so.>>"%LICENSE_FILE%"
    echo If you have any more questions, please seek ReadMe.txt or contact the author>>"%LICENSE_FILE%"
)

if not exist "%README_FILE%" (
    echo OrvetorQS ^(shortened OQS^) is a comprehensive Windows Batch utility designed for system administrators, power users and enthusiasts.>"%README_FILE%"
    echo Now you’d ask what is soooo special about this multipurpose batch-based script, but Vendezela Org. has your answer!>>"%README_FILE%"
    echo Unlike some programs, OQS has integrated numerous functions into one cohesive and interactive interface for the user.>>"%README_FILE%"
    echo This system acts as a supportive hand for the people who don’t have the time or the will to learn ^& understand certain elements inside the Command Prompt ^(also known as cmd^).>>"%README_FILE%"
    echo The navigation is easy, user-friendly and has many modules such as system information, management, backup>>"%README_FILE%"
    echo If you have any more questions regarding this tool, please contact the Organization or the author.>>"%README_FILE%"
    echo.>>"%README_FILE%"
    echo Security>>"%README_FILE%"
    echo.>>"%README_FILE%"
    echo This program ensures the security of the user, by saving everything locally so anything saved in the C:\Users\User\OQS ^(these folders and its contents are required for the use of the program^) is only available to the user ON THE RESPECTIVE COMPUTER.>>"%README_FILE%"
    echo.>>"%README_FILE%"
    echo If you must report any issues regarding security or issues, please contact the author.>>"%README_FILE%"
    echo.>>"%README_FILE%"
    echo Note: If you want to look deeper into the code yourself, you can change the extension of the program from .bat to a .txt file ^(if you have any trouble, seek additional help^)>>"%README_FILE%"
    echo.>>"%README_FILE%"
    echo Core Modules>>"%README_FILE%"
    echo.>>"%README_FILE%"
    echo WARNING: This Program works the best on Windows v10 respectively v11 ^(if run on v7 or v8, some features will not be implemented correctly or work at all^)>>"%README_FILE%"
    echo.>>"%README_FILE%"
    echo I. System Information>>"%README_FILE%"
    echo II. Network Diagnostics>>"%README_FILE%"
    echo III. File Management>>"%README_FILE%"
    echo IV. Backup ^& Restore>>"%README_FILE%"
    echo V. CleanUp Tool>>"%README_FILE%"
    echo And many more!>>"%README_FILE%"
    echo.>>"%README_FILE%"
    echo Speaking of educational insights, beyond functionality, OQS is transparent for the sole purpose of how each command work, how to manage complex batch flows and error handling for defensive tech; you can also understand how to diagnose server health, learn to script by modifying modules, demonstrate practical command-line utilities and many more!>>"%README_FILE%"
    echo.>>"%README_FILE%"
    echo Design>>"%README_FILE%"
    echo.>>"%README_FILE%"
    echo The design “philosophy” of this program is built around several principles for educational ^& moderance of the program such as modularity, error handling and robustness, accessibility and nonetheless the practicality of the examples like conditional branching and user interaction.>>"%README_FILE%"
)

if not exist "%CREDITS_FILE%" (
    echo OrvetorQS ^(OQS^) is a project developed by Vendezela Org. and its author Vendetaaaa.>"%CREDITS_FILE%"
    echo This project was made possible through the contributions and support of various resources.>>"%CREDITS_FILE%"
    echo For further information, please seek the OQS directory>>"%CREDITS_FILE%"
)

if not exist "%CONTACT_FILE%" (
    echo For more information that will help you please contact:>"%CONTACT_FILE%"
    echo E-mail: VZVendeta@hotmail.com>>"%CONTACT_FILE%"
    echo Github: Vendetaaaa>>"%CONTACT_FILE%"
)

if not exist "%LOG_FILE%" echo.>"%LOG_FILE%"
if not exist "%CRASH_FLAG%" echo.>"%CRASH_FLAG%"
if not exist "%CRASH_LOG%" echo.>"%CRASH_LOG%"
if not exist "%ERROR_LOG%" echo.>"%ERROR_LOG%"

if not exist "%LANGUAGE_1_FILE%" (
  echo Content will be added in a future update>>"%LANGUAGE_1_FILE%"
)

if not exist "%LANGUAGE_2_FILE%" (
  echo Content will be added in a future update>>"%LANGUAGE_2_FILE%"
)

if not exist "%LANGUAGE_3_FILE%" (
  echo Content will be added in a future update>>"%LANGUAGE_3_FILE%"
)

if not exist "%LANGUAGE_4_FILE%" (
  echo Content will be added in a future update>>"%LANGUAGE_4_FILE%"
)

if not exist "%LANGUAGE_5_FILE%" (
  echo Content will be added in a future update>>"%LANGUAGE_5_FILE%"
)

if not exist "%BUGS_AND_FIXES_FILE%" (
  echo This will be the file where the author will be writing future bugs and their respective fixes>>"%BUGS_AND_FIXES_FILE%"
)

if not exist "%INSTALL_FILE%" (
  echo Content to be made>>"%INSTALL_FILE%"
)

if not exist "%UPDATE_FILE%" (
  echo Content soon to be made>>"%UPDATE_FILE%"
)

if not exist "%CACHES_FILE%" (
  echo Content soon to be made>>"%CACHES_FILE%"
)

if not exist "%USER_PROFILE_FILE%" (
  echo [User Profile]>"%USER_PROFILE_FILE%"
  echo username=%USERNAME%>>"%USER_PROFILE_FILE%"
  echo fullname=%USER_FULLNAME%>>"%USER_PROFILE_FILE%"
  echo domain=%USERDOMAIN%>>"%USER_PROFILE_FILE%"
  echo home=%USER_HOME%>>"%USER_PROFILE_FILE%"
  echo created on=%DATE% %TIME%>>"%USER_PROFILE_FILE%"
  echo shortcuts=%USER_SHORTCUTS%>>"%USER_PROFILE_FILE%"
  echo favorites=%USER_FAVORITES%>>"%USER_PROFILE_FILE%"
  echo avatar=%USER_AVATAR%>>"%USER_PROFILE_FILE%"
)

if not exist "%ABOUT_AUTHOR_FILE%" (
echo title Vendetaaaa - The Polymath Archives>"%ABOUT_AUTHOR_FILE%"
echo  ========================================================== >> "%ABOUT_AUTHOR_FILE%"
echo                 VENDETA - POLYMATH ARCHIVES >> "%ABOUT_AUTHOR_FILE%"
echo      Math Research ^| Full-stack Dev ^| Olympiad Competitor >> "%ABOUT_AUTHOR_FILE%"
echo  ========================================================== >> "%ABOUT_AUTHOR_FILE%"
echo.  >> "%ABOUT_AUTHOR_FILE%"
echo  [ STEM DISCIPLINES ] >> "%ABOUT_AUTHOR_FILE%"
echo  - Mathematics: Academic Researcher (Regional Finalist) >> "%ABOUT_AUTHOR_FILE%"
echo  - Computing: Full Stack Web Dev (3+ Years) >> "%ABOUT_AUTHOR_FILE%"
echo  - Chemistry: Olympiad (Regional Finalist) >> "%ABOUT_AUTHOR_FILE%"
echo  - Physics: Olympiad (Regional Finalist) >> "%ABOUT_AUTHOR_FILE%"
echo. >> "%ABOUT_AUTHOR_FILE%"
echo  [ HUMANITIES ^& ARTS ] >> "%ABOUT_AUTHOR_FILE%"
echo  - Literature: Double International Top 1 (5+ Years) >> "%ABOUT_AUTHOR_FILE%"
echo  - Linguistics: NOL Top 4 >> "%ABOUT_AUTHOR_FILE%"
echo  - Arts: Regional Top 1 >> "%ABOUT_AUTHOR_FILE%"
echo. >> "%ABOUT_AUTHOR_FILE%"
echo  [ PHYSICAL ] >> "%ABOUT_AUTHOR_FILE%"
echo  - Fencing: Top 5/8 International (3 Years) >> "%ABOUT_AUTHOR_FILE%"
echo.>>"%ABOUT_AUTHOR_FILE%"
echo  [ RECENT ACHIEVEMENTS ]>>"%ABOUT_AUTHOR_FILE%"
echo  - European University Challenge 2026: 3/1071 (World Record)>>"%ABOUT_AUTHOR_FILE%"
echo  - Google Dev Program: 45 Badges earned>>"%ABOUT_AUTHOR_FILE%"
echo. >> "%ABOUT_AUTHOR_FILE%"
echo  [ TECH STACK ]>>"%ABOUT_AUTHOR_FILE%"
echo  - C++, Java, JavaScript, Node.js>>"%ABOUT_AUTHOR_FILE%"
echo  - Computer Science, Google Cloud, Supabase, MySQL>>"%ABOUT_AUTHOR_FILE%"
echo.>>"%ABOUT_AUTHOR_FILE%"
echo  [ CONTACT ] >> "%ABOUT_AUTHOR_FILE%"
echo  - Email: VZVendeta@hotmail.com>>"%ABOUT_AUTHOR_FILE%"
echo.>>"%ABOUT_AUTHOR_FILE%"
)

if not exist "%ABOUT_ORG_FILE%" (
  echo A community made to unite coders, join if you want: github:Vendetaaaa>"%ABOUT_ORG_FILE%"
)

:: --------------- Assurance (if not exist) ---------------
if not exist "%OQS_ASSURANCE_FF%" (
  set "MISSING_LIST="
  setlocal enabledelayedexpansion

  (
    echo OQS Assurance Folders and Files
    echo This is a part of the program, please do not delete

    echo Date: %date% %time%
    echo.

    for %%P in (
      "%ROOT_DIR%"
      "%CONFIGURATION_FILE%"
      "%APPDATA_DIR%"
      "%LANGUAGES_DIR%"
      "%LANGUAGE_1_FILE%"
      "%LANGUAGE_2_FILE%"
      "%LANGUAGE_3_FILE%"
      "%LANGUAGE_4_FILE%"
      "%LANGUAGE_5_FILE%"
      "%DOCUMENTS_DIR%"
      "%README_FILE%"
      "%LICENSE_FILE%"
      "%CONTACT_FILE%"
      "%CREDITS_FILE%"
      "%DATA_DIR%"
      "%LOG_DIR%"
      "%TEMPORARY_DIR%"
      "%LOG_FILE%"
      "%CRASH_FLAG%"
      "%CRASH_LOG%"
      "%ERROR_LOG%"
      "%OPERATIONS_DIR%"
      "%BUGS_AND_FIXES_DIR%"
      "%BUGS_AND_FIXES_FILE%"
      "%INSTALL_FILE%"
      "%UPDATE_FILE%"
      "%CACHES_FILE%"
      "%PROFILE_DIR%"
      "%USER_DIR%"
      "%USER_PROFILE_FILE%"
      "%ABOUT_AUTHOR_FILE%"
      "%ABOUT_ORG_FILE%"
      "%DATA_DIR%\Backups"
    ) do (
      if exist %%~P (
        echo %%~P exists
      ) else (
        echo %%~P is missing
        set "MISSING_LIST=!MISSING_LIST!%%~P|"
      )
    )
  ) > "%OQS_ASSURANCE_FF%"

  rem Remove old flags so only one exists
  if exist "%OQS_ASSURANCE_FLAG_1%" del /q "%OQS_ASSURANCE_FLAG_1%"
  if exist "%OQS_ASSURANCE_FLAG_2%" del /q "%OQS_ASSURANCE_FLAG_2%"

  if "!MISSING_LIST!"=="" (
    > "%OQS_ASSURANCE_FLAG_1%" echo C 2025 OQS
    >> "%OQS_ASSURANCE_FLAG_1%" echo Everything has been made successfully
  ) else (
    > "%OQS_ASSURANCE_FLAG_2%" echo C 2025 OQS
    >> "%OQS_ASSURANCE_FLAG_2%" echo Everything has been successfully made except:
    for %%M in (!MISSING_LIST!) do (
      >> "%OQS_ASSURANCE_FLAG_2%" echo %%M
    )
  )
)

if not exist "%COMMAND_GUIDE_FILE%" (
    echo NAVIGATION>"%COMMAND_GUIDE_FILE%"
    echo    - Use numbers [1-6] to enter specific modules.>>"%COMMAND_GUIDE_FILE%"
    echo    - Use letters [T, F, G, E] for global settings and exit.>>"%COMMAND_GUIDE_FILE%"
    echo    - In menus, "R" or "e" typically returns you to the previous screen.>>"%COMMAND_GUIDE_FILE%"
)

call :LoadConfig


:: --------------- Argument Handling ---------------
if /i "%~1"=="/?" goto :Usage
if /i "%~1"=="--help" goto :Usage
if /i "%~1"=="/quick" (
  call :QuickActions
  goto :End
)


:: --------------- Entry ---------------
:MainMenu
cls
call :Banner
echo.
set "choice="
echo [1] System Information
echo [2] Network Tools
echo [3] File Operations
echo [4] Backup
echo [5] Cleanup
if exist "%CONFIGURATION_FILE%" echo [6] View/Reload Config
echo.
echo [G] Command Guide
echo [T] Theme
echo [F] OQS Folder
echo [E] Exit
echo.
set /p "choice=Select an option: "
if /i "%choice%"=="1" goto :SystemInfo
if /i "%choice%"=="2" goto :NetworkMenu
if /i "%choice%"=="3" goto :ExplorerLoop
if /i "%choice%"=="4" goto :BackupMenu
if /i "%choice%"=="5" goto :CleanupMenu
if /i "%choice%"=="6" goto :ConfigMenu
if /i "%choice%"=="G" start notepad "%COMMAND_GUIDE_FILE%" & goto :MainMenu
if /i "%choice%"=="T" goto :ThemeMenu
if /i "%choice%"=="F" goto :AppDataMenu
if /i "%choice%"=="E" goto :End
echo.
echo Invalid selection. Press any key to continue...
pause >nul
goto :MainMenu


:: --------------- Banner ---------------
:Banner
color %COLOR%
set "bar=▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬"
setlocal EnableDelayedExpansion
set "colWidth=45"
set "gap=    "  REM 4 spaces
set "col1_Name=Name: %APP_NAME%"
set "col1_Version=Version: %APP_VERSION%"
set "col1_Root=Root: %BASE_DIR%"
set "col1_User=User: %USERNAME%"
call :PadRight "!col1_Name!" %colWidth% COL1_NAME_PAD
call :PadRight "!col1_Version!" %colWidth% COL1_VERSION_PAD
call :PadRight "!col1_Root!" %colWidth% COL1_ROOT_PAD
call :PadRight "!col1_User!" %colWidth% COL1_USER_PAD
echo %bar%
echo   !COL1_NAME_PAD!%gap%Theme: %COLOR%
echo   !COL1_VERSION_PAD!%gap%ADMIN: %ISADMIN%
echo   !COL1_ROOT_PAD!%gap%Language: %CONFIGURATION_language%
echo   !COL1_USER_PAD!%gap%AppData: %APPDATA_DIR%
echo.
call :ClockAndDate
echo %bar%
endlocal
exit /b
:PadRight
REM %1 = text, %2 = width, %3 = output variable
setlocal EnableDelayedExpansion
set "text=%~1                                                        " 
set "text=!text:~0,%2!"
endlocal & set "%~3=%text%"
exit /b

REM you can increse or decrease the width of the columns by changing the colWidth variable
REM you can increase or decrease the gap between columns by changing the gap variable



:: --------------- Theme Menu ---------------
:ThemeMenu
cls
call :Banner
echo Theme Menu:
echo.
echo [1] Set Foreground Color
echo [2] Set Background Color
echo [3] Reset to Default
echo [R] Return
echo.
set /p "tchoice=Select: "
if /i "%tchoice%"=="1" goto :ThemeFG
if /i "%tchoice%"=="2" goto :ThemeBG
if /i "%tchoice%"=="3" (
    set "COLOR=%DEFAULT_COLOR%"
    color %COLOR%
    goto :ThemeMenu
)
if /i "%tchoice%"=="R" goto :MainMenu
goto :ThemeMenu



:ThemeFG
cls
call :Banner
echo Foreground Color Codes:
echo.
echo Black: 0 
echo Blue: 1 
echo Green: 2 
echo Aqua: 3 
echo Red: 4 
echo Purple: 5 
echo Yellow: 6 
echo White: 7
echo Gray: 8 
echo LightBlue: 9 
echo LightGreen: A 
echo LightAqua: B 
echo LightRed: C 
echo LightPurple: D 
echo LightYellow: E 
echo BrightWhite: F
echo.
echo Current: %COLOR%
set /p "fg=Enter foreground color code (0-F): "
if not defined fg goto :ThemeMenu
set "COLOR=%bg%%fg%"
color %COLOR%
goto :ThemeMenu



:ThemeBG
cls
call :Banner
echo Background Color Codes:
echo.
echo Black: 0 
echo Blue: 1 
echo Green: 2 
echo Aqua: 3 
echo Red: 4 
echo Purple: 5 
echo Yellow: 6 
echo White: 7
echo Gray: 8 
echo LightBlue: 9 
echo LightGreen: A 
echo LightAqua: B 
echo LightRed: C 
echo LightPurple: D 
echo LightYellow: E 
echo BrightWhite: F
echo.
echo Current: %COLOR%
set /p "bg=Enter background color code (0-F): "
if not defined bg goto :ThemeMenu
if not defined fg set "fg=7"
set "COLOR=%bg%%fg%"
color %COLOR%
goto :ThemeMenu


:: --------------- Clock and Date ---------------
:ClockAndDate
setlocal EnableDelayedExpansion
set "_now=%time%"
set "_hour=!_now:~0,2!"
set "_min=!_now:~3,2!"
set "_sec=!_now:~6,2!"
set "_ampm=AM"
set /a "_h=!_hour!"
if !_h! GEQ 12 (
  set "_ampm=PM"
  if !_h! GTR 12 set /a "_h=!_h!-12"
) else (
  if !_h! EQU 0 set "_h=12"
)
if !_h! LSS 10 set "_h=0!_h!"
set "_showtime=!_h!:!_min!:!_sec! !_ampm!"
REM NOTE: DATE format varies by locale. tokens=2-4 with delims=/-. covers most formats
REM (MM/DD/YYYY, DD-MM-YYYY, YYYY.MM.DD). The _test GTR 12 swap handles DD/MM locales
REM where day appears before month. May still break on uncommon formats like ddd MM/DD/YYYY.
for /f "tokens=2-4 delims=/-. " %%a in ("%DATE%") do (
  set "_month=%%a"
  set "_day=%%b"
  set "_year=%%c"
)
set /a "_test=1*_month"
if !_test! GTR 12 (
  set "_tmp=!_month!"
  set "_month=!_day!"
  set "_day=!_tmp!"
)
set "_showdate=!_day!.!_month!.!_year!"


echo TIME: !_showtime!
echo DATE: !_showdate!
echo.
endlocal
exit /b


:: --------------- Logging ---------------
:Log
set "_lvl=%~1"
set "_msg=%~2"
set "_ts=%DATE% %TIME%"
>>"%LOG_FILE%" echo [%_ts%] [%_lvl%] %_msg%
exit /b



:ViewLog
cls
if not exist "%LOG_FILE%" (
  echo No log file yet.
  pause >nul
  goto :MainMenu
)
more "%LOG_FILE%"
echo.
pause
goto :MainMenu




:ClearLog
cls
choice /m "Are you sure you want to clear the log?"
if errorlevel 2 goto :MainMenu
type nul > "%LOG_FILE%"
call :Log INFO "Log cleared by user"
echo Cleared.
pause
goto :MainMenu


:: --------------- Configuration ---------------
:ConfigMenu
cls
call :Banner
if not exist "%CONFIGURATION_FILE%" (
  echo Config file missing at: %CONFIGURATION_FILE%
  pause & goto :MainMenu
)
echo Current config:
for /f "usebackq tokens=* delims=" %%A in ("%CONFIGURATION_FILE%") do echo   %%A
echo.
echo [1] Reload Config into variables
echo [2] Edit Config in Notepad
echo [R] Return
set /p "choice=Select: "
if /i "%choice%"=="1" call :LoadConfig & pause & goto :MainMenu
if /i "%choice%"=="2" start notepad "%CONFIGURATION_FILE%" & goto :MainMenu
goto :MainMenu



:LoadConfig
for /f "usebackq tokens=1,2 delims==" %%K in ("%CONFIGURATION_FILE%") do (
  set "key=%%K"
  set "val=%%L"
  if not "!key:~0,1!"==";" if defined key if defined val set "CONFIGURATION_!key!=!val!"
)
call :Log INFO "Config reloaded"
exit /b


:: --------------- System Info ---------------
:SystemInfo
cls
call :Banner
call :Log INFO "System info viewed"
echo.
echo.
echo ------------------------------------------------------------
echo                   🖥️ SYSTEM INFORMATION 🖥️
echo ------------------------------------------------------------
echo.
echo Hostname: %COMPUTERNAME%
echo User: %USERNAME%
echo Domain: %USERDOMAIN%
echo OS: %OS%
for /f "tokens=* delims=" %%V in ('ver') do echo Version: %%V
echo CPU: %PROCESSOR_IDENTIFIER%
echo Arch: %PROCESSOR_ARCHITECTURE%
echo Cores: %NUMBER_OF_PROCESSORS%
echo.
echo ------------------------------------------------------------
echo                   🌐 NETWORK INFORMATION 🌐
echo ------------------------------------------------------------
echo.
echo IP, DHCP, DNS addresses:
ipconfig | findstr /i "IPv4 DHCP DNS"
echo.
echo Default Gateway:
for /f "tokens=3" %%a in ('ipconfig ^| findstr "Default Gateway"') do echo %%a
echo.
echo Network Adapters:
wmic nic where "NetEnabled='true'" get Name,MACAddress,Speed,AdapterType
echo.
echo MAC Address:
getmac /v /fo list | findstr "Physical"
echo.
echo Active Connections:
netstat -an | findstr "ESTABLISHED"
echo.
echo ------------------------------------------------------------
echo                   ⚙️ PERFORMANCE INFORMATION ⚙️
echo ------------------------------------------------------------
echo.
echo CPU Usage:
wmic cpu get Name,LoadPercentage,NumberOfCores,NumberOfLogicalProcessors
echo.
echo GPU Usage:
wmic path win32_videocontroller get Name,AdapterRAM,DriverVersion
echo.
echo RAM Usage:
wmic OS get TotalVisibleMemorySize,FreePhysicalMemory /value | findstr "="
echo.
echo Page File:
wmic pagefile list /format:list | findstr "="
echo.
echo ------------------------------------------------------------
echo                   📀 STORAGE INFORMATION 📀
echo ------------------------------------------------------------
echo.
echo Logical Drives:
wmic logicaldisk get DeviceID,VolumeName,FileSystem,FreeSpace,Size 2>nul | more
echo.
echo Disk Drives (Physical):
wmic diskdrive get Model,InterfaceType,Size,Status 2>nul
echo.
echo Disk Partitions:
wmic partition get Name,DiskIndex,Size,Type 2>nul
echo.
echo Disk Usage Summary:
fsutil volume diskfree c:
echo.
echo ------------------------------------------------------------
echo                   👥 USER INFORMATION 👥
echo ------------------------------------------------------------
echo.
echo Logged-in Users:
query user
echo.
echo Current User Groups:
whoami /groups
echo.
echo ------------------------------------------------------------
echo                   🛠️ HARDWARE INFORMATION 🛠️
echo ------------------------------------------------------------
echo.
echo Manufacturer / Model:
wmic computersystem get Manufacturer,Model
echo.
echo BIOS Info:
wmic bios get SMBIOSBIOSVersion,SerialNumber,ReleaseDate
echo.
echo Motherboard:
wmic baseboard get Product,Manufacturer,SerialNumber,Version
echo.
echo ------------------------------------------------------------
echo                   ⚡ POWER INFORMATION ⚡
echo ------------------------------------------------------------
echo.
wmic path Win32_Battery get EstimatedChargeRemaining,BatteryStatus
echo.
echo Active Power Plan:
powercfg /getactivescheme
echo.
echo.
echo.
echo.
echo.
pause
goto :MainMenu


:: --------------- Network Tools ---------------
:NetworkMenu
cls
call :Banner
echo.
echo [1] Ping Tool
echo [2] Trace Route
echo [3] DNS Lookup
echo [4] Show Active Connections
echo [5] IP Configuration
echo [6] Flush DNS Cache
echo [7] View ARP Table
echo [R] Return
echo.
set /p "choice=Select: "
if /i "%choice%"=="1" goto :PingTool
if /i "%choice%"=="2" goto :TraceTool
if /i "%choice%"=="3" goto :DNSLook
if /i "%choice%"=="4" goto :ActiveC
if /i "%choice%"=="5" goto :IPConfigTool
if /i "%choice%"=="6" goto :FlushDNSTool
if /i "%choice%"=="7" goto :ARPTable
goto :MainMenu



:PingTool
echo.
echo ---------------------------------------------
echo   🔒 Ping Tool — Test connectivity with ICMP 🔒
echo ---------------------------------------------
echo.
set /p "host=Enter host/IP to ping: "
if not defined host goto :NetworkMenu
call :Log INFO "Ping %host%"
echo — Running Ping Test —
ping -n 4 "%host%"
echo — Ping Completed —
echo.
pause
goto :NetworkMenu



:TraceTool
echo.
echo ---------------------------------------------
echo   🔒 Trace Route — Show packet path to user 🔒
echo ---------------------------------------------
echo.
set /p "host=Enter host/IP to trace: "
if not defined host goto :NetworkMenu
call :Log INFO "Tracert %host%"
echo — Running Trace Route —
tracert "%host%"
echo — Trace Completed —
echo.
pause
goto :NetworkMenu



:DNSLook
echo.
echo --------------------------------------------
echo   🔒 DNS Lookup — Resolve domain to IP 🔒
echo --------------------------------------------
echo.
set /p "host=Enter domain for DNS lookup: "
if not defined host goto :NetworkMenu
call :Log INFO "NSLookup %host%"
echo — Running DNS Lookup —
nslookup "%host%"
echo — Lookup Completed —
echo.
pause
goto :NetworkMenu



:ActiveC
echo.
echo ------------------------------------------------------------
echo   🔒 Active Connections — Show active connections and ports 🔒
echo ------------------------------------------------------------
echo.
call :Log INFO "Netstat viewed"
echo — Showing Active Network Connections —
netstat -ano | more
echo — End of List —
echo.
pause
goto :NetworkMenu



:IPConfigTool
echo.
echo -----------------------------------------------------------
echo   🔒 IP Configuration — Show all adapter information 🔒
echo -----------------------------------------------------------
echo.
call :Log INFO "IP Config viewed"
echo — Displaying IP Configuration —
ipconfig /all | more
echo — End of IP Config —
echo.
pause
goto :NetworkMenu



:FlushDNSTool
echo.
echo -----------------------------------------------
echo   🔒 Flush DNS — Clear local resolver cache 🔒
echo -----------------------------------------------
echo.
call :Log INFO "Flushed DNS cache"
echo — Flushing DNS Resolver Cache —
ipconfig /flushdns
echo — DNS Cache Cleared —
echo.
pause
goto :NetworkMenu



:ARPTable
echo.
echo ------------------------------------------------
echo   🔒 ARP Table — Show cached MAC/IP mapping 🔒
echo ------------------------------------------------
echo.
call :Log INFO "Viewed ARP table"
echo — Displaying ARP Table —
arp -a
echo — End of ARP List —
echo.
pause
goto :NetworkMenu


:: --------------- File Menu ---------------
:ExplorerLoop
cls
setlocal EnableDelayedExpansion
if not defined currentPath set "currentPath=%USERPROFILE%"
set "count=0"
echo ------------------------------------------------------------
echo ^|                  📄 File ^& Folder Menu 📁                ^|
echo ------------------------------------------------------------
echo.
echo Current Path: !currentPath!
echo.
echo.
call :PrintTree "!currentPath!" ""
echo.
echo ------------------------------------------------------------
echo ^| Commands:                                                ^|
echo ^|                                                          ^|
echo ^| cd [number]   - enter folder                             ^|
echo ^| cd ..         - go up one level                    ^|
echo ^| open [number] - open file                                ^|
echo ^| up            - go to parent directory                   ^|
echo ^| menu          - file/folder operations menu              ^|
echo ^| exit          - return to Main Menu                      ^| 
echo ------------------------------------------------------------
echo.
set /p "choice=> "

if /i "!choice!"=="cd .." (
    call :GoUpOne
    goto ExplorerLoop
)

for /f "tokens=1,2" %%a in ("!choice!") do (
    if /i "%%a"=="cd" (
        if defined item[%%b] (
            set "target=!item[%%b]!"
            if exist "!target!\" (
                set "currentPath=!target!"
            ) else (
                echo Not a directory.
                pause
            )
            goto ExplorerLoop
        ) else (
            echo Invalid index.
            pause
            goto ExplorerLoop
        )
    )

    if /i "%%a"=="open" (
        if defined item[%%b] (
            start "" "!item[%%b]!"
        ) else (
            echo Invalid index.
            pause
        )
        goto ExplorerLoop
    )
)

if /i "!choice!"=="up" (
    set "currentPath=C:\"
    goto ExplorerLoop
)

if /i "!choice!"=="menu" (
    call :FileOpsMenu
    goto ExplorerLoop
)

if /i "!choice!"=="exit" goto :MainMenu

echo Invalid input.
pause
goto ExplorerLoop

:PrintTree
set "folder=%~1"
set "prefix=%~2"

for /d %%D in ("%folder%\*") do (
    set /a count+=1
    set "item[!count!]=%%~fD"
    set "label=!count!"
    echo !prefix!├── [!label!] 📁 %%~nxD
)

for %%F in ("%folder%\*") do (
    if not exist "%%F\" (
        set /a count+=1
        set "item[!count!]=%%~fF"
        set "label=!count!"
        echo !prefix!├── [!label!] 📄 %%~nxF
    )
)
goto :eof

:GoUpOne
if /i "!currentPath!"=="C:\" exit /b
if /i "!currentPath!"=="C:" (
    set "currentPath=C:\"
    exit /b
)

for %%A in ("!currentPath!") do set "parent=%%~dpA"

if "!parent!"=="" set "parent=C:\"

if /i "!parent!"=="C:\" (
    set "currentPath=C:\"
) else (
    if "!parent:~-1!"=="\" set "parent=!parent:~0,-1!"
    set "currentPath=!parent!"
)
exit /b




:FileOpsMenu
cls
echo ------------------------------------------------------------
echo ^|              FILE / FOLDER OPERATIONS MENU               ^|
echo ------------------------------------------------------------
echo.
echo Current Path: !currentPath!
echo.
echo.
call :ShowMiniExplorer
echo.

echo ------------------------------------------------------------
echo ^|                      OPERATIONS                          ^|
echo ------------------------------------------------------------
echo ^| 1. ➕ Create File                                        ^|
echo ^| 2. ✏️ Rename File                                        ^|
echo ^| 3. 📄 Copy File                                          ^|
echo ^| 4. 🚚 Move File                                          ^|
echo ^| 5. ⚠️ Delete File                                        ^|
echo ------------------------------------------------------------
echo ^| 6. ➕ Create Folder                                      ^|
echo ^| 7. ✏️ Rename Folder                                      ^|
echo ^| 8. 📂 Copy Folder                                        ^|
echo ^| 9. 🚚 Move Folder                                        ^|
echo ^| 10. ⚠️ Delete Folder                                     ^|
echo ------------------------------------------------------------
echo ^| 11. ◀️Back to Explorer                                   ^|
echo ------------------------------------------------------------
echo.
set /p "fopt=Select an option: "

if "!fopt!"=="1" call :CreateFile
if "!fopt!"=="2" call :RenameFile
if "!fopt!"=="3" call :CopyFile
if "!fopt!"=="4" call :MoveFile
if "!fopt!"=="5" call :DeleteFile

if "!fopt!"=="6" call :CreateFolder
if "!fopt!"=="7" call :RenameFolder
if "!fopt!"=="8" call :CopyFolder
if "!fopt!"=="9" call :MoveFolder
if "!fopt!"=="10" call :DeleteFolder

if "!fopt!"=="11" exit /b
goto FileOpsMenu

:ResolveSelection
setlocal
set "result="
set "input=%~2"

if defined item[%input%] (
    set "result=!item[%input%]!"
) else (
    set "candidate=!currentPath!\%input%"
    if exist "!candidate!" set "result=!candidate!"
)
endlocal & set "%~1=%result%"
exit /b

:CreateFile
cls
echo ------------------------------------------------------------
echo ^|                       CREATE FILE                        ^|
echo ------------------------------------------------------------
echo.
echo Current Path: !currentPath!
echo.
echo.
set /p "fname=📄 Enter new file name (with extension): "
if "!fname!"=="" goto FileOpsMenu

if exist "!currentPath!\!fname!" (
    echo ⚠️ File "!fname!" already exists!
    pause
    goto FileOpsMenu
)
if exist "!currentPath!\!fname!\" (
    echo ⚠️ A folder with the name "!fname!" already exists!
    pause
    goto FileOpsMenu
)

echo.>"!currentPath!\!fname!"
if errorlevel 1 (
    echo ❌ Failed to create file "!fname!".
) else (
    echo ✅ File "!fname!" created successfully.
)
pause
goto FileOpsMenu

:CopyFile
cls
call :ShowMiniExplorer
echo.
set /p "src=📄 Enter file number or name to copy: "
if "!src!"=="" goto FileOpsMenu
call :ResolveSelection srcFile "!src!"
if not defined srcFile (
    echo ⚠️ Invalid selection.
    pause
    goto FileOpsMenu
)

set /p "dst=📂 Enter destination folder path or number: "
if "!dst!"=="" goto FileOpsMenu
call :ResolveSelection dstFolder "!dst!"
if not defined dstFolder (
    echo ⚠️ Destination folder does not exist.
    pause
    goto FileOpsMenu
)

copy "!srcFile!" "!dstFolder!\" /Y >nul
if errorlevel 1 (
    echo ❌ Failed to copy file.
) else (
    echo ✅ File copied successfully.
)
pause
goto FileOpsMenu

:MoveFile
cls
call :ShowMiniExplorer
echo.
set /p "src=📄 Enter file number or name to move: "
if "!src!"=="" goto FileOpsMenu
call :ResolveSelection srcFile "!src!"
if not defined srcFile (
    echo ⚠️ Invalid selection.
    pause
    goto FileOpsMenu
)

set /p "dst=📂 Enter destination folder path or number: "
if "!dst!"=="" goto FileOpsMenu
call :ResolveSelection dstFolder "!dst!"
if not defined dstFolder (
    echo ⚠️ Destination folder does not exist.
    pause
    goto FileOpsMenu
)

move "!srcFile!" "!dstFolder!\" >nul
if errorlevel 1 (
    echo ❌ Failed to move file.
) else (
    echo ✅ File moved successfully.
)
pause
goto FileOpsMenu

:DeleteFile
cls
call :ShowMiniExplorer
echo.
set /p "src=📄 Enter file number or name to delete: "
if "!src!"=="" goto FileOpsMenu
call :ResolveSelection srcFile "!src!"
if not defined srcFile (
    echo ⚠️ Invalid selection.
    pause
    goto FileOpsMenu
)

echo ------------------------------------------------------------
echo ^| ⚠️  WARNING: You are about to delete this file!   ⚠️    ^|
echo ^| ⚠️                    !srcFile!                   ⚠️    ^|
echo ------------------------------------------------------------
set /p "confirm=Are you sure? (Y/N): "
if /i not "!confirm!"=="Y" goto FileOpsMenu

del /F /Q "!srcFile!"
echo ✅ File deleted successfully.
pause
goto FileOpsMenu

:RenameFile
cls
call :ShowMiniExplorer
echo.
set /p "src=📄 Enter file number or name to rename: "
if "!src!"=="" goto FileOpsMenu
call :ResolveSelection oldName "!src!"
if not defined oldName (
    echo ⚠️ Invalid selection.
    pause
    goto FileOpsMenu
)

for %%A in ("!oldName!") do set "oldBase=%%~nxA"
set /p "newName=✏️ Enter new file name (with extension): "
if "!newName!"=="" goto FileOpsMenu
if /i "!newName!"=="!oldBase!" (
    echo ⚠️ File already has this name.
    pause
    goto FileOpsMenu
)

ren "!oldName!" "!newName!"
echo ✅ File renamed successfully.
pause
goto FileOpsMenu


:CreateFolder
cls
echo ------------------------------------------------------------
echo ^|                       CREATE FOLDER                      ^|
echo ------------------------------------------------------------
echo Current Path: !currentPath!
echo.
set /p "dname=📂 Enter new folder name: "
if "!dname!"=="" goto FileOpsMenu

if exist "!currentPath!\!dname!\" (
    echo ⚠️ Folder "!dname!" already exists!
    pause
    goto FileOpsMenu
)
if exist "!currentPath!\!dname!" (
    echo ⚠️ A file with the name "!dname!" already exists!
    pause
    goto FileOpsMenu
)

mkdir "!currentPath!\!dname!"
if errorlevel 1 (
    echo ❌ Failed to create folder "!dname!".
) else (
    echo ✅ Folder "!dname!" created successfully.
)
pause
goto FileOpsMenu

:CopyFolder
cls
call :ShowMiniExplorer
echo.
set /p "src=📂 Enter folder number or name to copy: "
if "!src!"=="" goto FileOpsMenu
call :ResolveSelection srcFolder "!src!"
if not defined srcFolder (
    echo ⚠️ Invalid selection.
    pause
    goto FileOpsMenu
)

for %%A in ("!srcFolder!") do set "srcName=%%~nxA"
set /p "dst=📂 Enter destination path or number: "
if "!dst!"=="" goto FileOpsMenu
call :ResolveSelection dstFolder "!dst!"
if not defined dstFolder (
    echo ⚠️ Destination folder does not exist.
    pause
    goto FileOpsMenu
)

xcopy "!srcFolder!" "!dstFolder!\!srcName!" /E /I /H /Y >nul
if errorlevel 1 (
    echo ❌ Failed to copy folder.
) else (
    echo ✅ Folder copied successfully.
)
pause
goto FileOpsMenu

:MoveFolder
cls
call :ShowMiniExplorer
echo.
set /p "src=📂 Enter folder number or name to move: "
if "!src!"=="" goto FileOpsMenu
call :ResolveSelection srcFolder "!src!"
if not defined srcFolder (
    echo ⚠️ Invalid selection.
    pause
    goto FileOpsMenu
)

set /p "dst=📂 Enter destination path or number: "
if "!dst!"=="" goto FileOpsMenu
call :ResolveSelection dstFolder "!dst!"
if not defined dstFolder (
    echo ⚠️ Destination folder does not exist.
    pause
    goto FileOpsMenu
)

move "!srcFolder!" "!dstFolder!\" >nul
if errorlevel 1 (
    echo ❌ Failed to move folder.
) else (
    echo ✅ Folder moved successfully.
)
pause
goto FileOpsMenu

:DeleteFolder
cls
call :ShowMiniExplorer
echo.
set /p "src=📂 Enter folder number or name to delete: "
if "!src!"=="" goto FileOpsMenu
call :ResolveSelection srcFolder "!src!"
if not defined srcFolder (
    echo ⚠️ Invalid selection.
    pause
    goto FileOpsMenu
)

echo -------------------------------------------------------------
echo ^| ⚠️ WARNING: You are about to permanently delete this ⚠️  ^|
echo ^| ⚠️ folder and all its contents!                      ⚠️  ^|
echo ^| ⚠️                   !srcFolder!                     ⚠️  ^|    
echo -------------------------------------------------------------
set /p "confirm=Are you sure? (Y/N): "
if /i not "!confirm!"=="Y" goto FileOpsMenu

rmdir /S /Q "!srcFolder!"
echo ✅ Folder deleted successfully.
pause
goto FileOpsMenu

:RenameFolder
cls
call :ShowMiniExplorer
echo.
set /p "src=📂 Enter folder number or name to rename: "
if "!src!"=="" goto FileOpsMenu
call :ResolveSelection oldName "!src!"
if not defined oldName (
    echo ⚠️ Invalid selection.
    pause
    goto FileOpsMenu
)

for %%A in ("!oldName!") do set "oldBase=%%~nxA"
set /p "newName=✏️ Enter new folder name: "
if "!newName!"=="" goto FileOpsMenu
if /i "!newName!"=="!oldBase!" (
    echo ⚠️ Folder already has this name.
    pause
    goto FileOpsMenu
)

ren "!oldName!" "!newName!"
echo ✅ Folder renamed successfully.
pause
goto FileOpsMenu


:ShowMiniExplorer
echo ------------------------------------------------------------
echo ^|                  📂 MINI EXPLORER PREVIEW                ^|
echo ------------------------------------------------------------
set "previewCount=0"
for /d %%D in ("!currentPath!\*") do (
    set /a previewCount+=1
    echo   [!previewCount!] 📁 %%~nxD
    set "item[!previewCount!]=%%D"
)
for %%F in ("!currentPath!\*") do (
    if not exist "%%F\" (
        set /a previewCount+=1
        echo   [!previewCount!] 📄 %%~nxF
        set "item[!previewCount!]=%%F"
    )
)
exit /b



:: ---------------------- Backup & Restore -------------------------
:BackupMenu
cls
call :Banner

:: Backup root defaults to OQS data folder
REM Backup root is defined in globals as DATA_DIR\Backups
if not defined BACKUP_ROOT set "BACKUP_ROOT=%DATA_DIR%\Backups"
if not defined BACKUP_SRC set "BACKUP_SRC=%USERPROFILE%\Documents"
if not defined KEEP_COUNT set "KEEP_COUNT=5"

:: Ensure backup folder exists
if not exist "%BACKUP_ROOT%" mkdir "%BACKUP_ROOT%" >nul 2>&1

:: Main Menu
echo.
echo ╔═══════════════════════════════════════════════════════════╗
echo ║                  BACKUP ^& RESTORE MANAGER                 ║
echo ╠═══════════════════════════════════════════════════════════╣
echo ║ Source folder:                                            
echo ║   %BACKUP_SRC%                                            
echo ║                                                           
echo ║ Backup location:                                          
echo ║   %BACKUP_ROOT%                                           
echo ║                                                           
echo ║ Keep only last %KEEP_COUNT% backups (auto-clean enabled)  
echo ╚═══════════════════════════════════════════════════════════╝
echo.
echo   [1] Create New Backup
echo   [2] Restore From Backup
echo   [3] View Backup History
echo   [4] Delete Backup
echo   [5] Change Settings (source / cleanup)
echo   [R] Return to Main Menu
echo.
set /p "choice=Select an option: "

if /i "%choice%"=="1" goto :DoBackup
if /i "%choice%"=="2" goto :DoRestore
if /i "%choice%"=="3" goto :DoHistory
if /i "%choice%"=="4" goto :DoDelete
if /i "%choice%"=="5" goto :DoSettings
if /i "%choice%"=="R" goto :MainMenu
goto :BackupMenu


:DoBackup
cls
echo.
echo === CREATE BACKUP ===
echo Source: %BACKUP_SRC%
echo Target: %BACKUP_ROOT%
echo.
set /p "confirm=Proceed with backup? (Y/N): "
if /i not "%confirm%"=="Y" goto :BackupMenu

:: Timestamp for folder name
set "ts=%date:~-4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%"
set "ts=%ts: =0%"
set "dest=%BACKUP_ROOT%\BKP_%ts%"
mkdir "%dest%" >nul 2>&1

echo Creating backup in "%dest%" ...
robocopy "%BACKUP_SRC%" "%dest%" /MIR /R:2 /W:2 /MT:8 /NFL /NDL /NP /LOG+:"%BACKUP_ROOT%\backup.log"
if errorlevel 8 (
    echo WARNING: Some files failed. Check backup.log for details.
) else (
    echo Backup completed successfully!
)

echo [%date% %time%] Backup created: %dest% >>"%BACKUP_ROOT%\backup_history.txt"

:: AUTO CLEANUP
for /f "skip=%KEEP_COUNT% delims=" %%B in ('dir /b /ad /o-d "%BACKUP_ROOT%\BKP_*" 2^>nul') do (
    echo Auto-clean: deleting old backup %%B
    rd /s /q "%BACKUP_ROOT%\%%B"
    echo [%date% %time%] Auto-clean deleted: %%B >>"%BACKUP_ROOT%\backup_history.txt"
)

pause
goto :BackupMenu


:DoRestore
cls
echo.
echo === RESTORE BACKUP ===
echo Available backups:
echo ---------------------------------------------------
dir /b /ad "%BACKUP_ROOT%\BKP_*" 2>nul || (echo None found.& pause & goto :BackupMenu)
echo ---------------------------------------------------
set /p "src=Enter backup folder name to restore (blank=cancel): "
if "%src%"=="" goto :BackupMenu
if not exist "%BACKUP_ROOT%\%src%" (echo Not found.& pause & goto :BackupMenu)

set /p "target=Enter restore destination (blank=cancel): "
if "%target%"=="" goto :BackupMenu
if not exist "%target%" mkdir "%target%" >nul 2>&1

echo.
echo You are about to restore:
echo   From: "%src%"
echo   To:   "%target%"
set /p "sure=Are you sure? (Y/N): "
if /i not "%sure%"=="Y" goto :BackupMenu

robocopy "%BACKUP_ROOT%\%src%" "%target%" /E /R:1 /W:1 /MT:8 /NFL /NDL /NP /LOG+:"%BACKUP_ROOT%\restore.log"
if errorlevel 8 (
    echo WARNING: Some files may not have been restored. Check restore.log.
) else (
    echo Restore completed successfully!
)

echo [%date% %time%] Restored %src% to %target% >>"%BACKUP_ROOT%\backup_history.txt"
pause
goto :BackupMenu


:DoHistory
cls
echo.
echo === BACKUP HISTORY ===
if exist "%BACKUP_ROOT%\backup_history.txt" (
    type "%BACKUP_ROOT%\backup_history.txt"
) else (
    echo No history found.
)
echo.
pause
goto :BackupMenu


:DoDelete
cls
echo.
echo === DELETE BACKUP ===
echo Available backups:
echo ---------------------------------------------------
for /f "delims=" %%B in ('dir /b /ad "%BACKUP_ROOT%\BKP_*" 2^>nul ^| sort') do echo   %%B
echo ---------------------------------------------------
set /p "del=Enter backup folder to delete (blank=cancel): "
if "%del%"=="" goto :BackupMenu
if not exist "%BACKUP_ROOT%\%del%" (echo Not found.& pause & goto :BackupMenu)

set /p "sure=Confirm deletion of '%del%'? (Y/N): "
if /i not "%sure%"=="Y" goto :BackupMenu

rd /s /q "%BACKUP_ROOT%\%del%"
echo Deleted "%del%"
echo [%date% %time%] Deleted backup: %del% >>"%BACKUP_ROOT%\backup_history.txt"
pause
goto :BackupMenu


:DoSettings
cls
echo.
echo === SETTINGS ===
echo Current source: %BACKUP_SRC%
echo Backup root:    %BACKUP_ROOT%
echo Keep backups:   %KEEP_COUNT%
echo.
echo [1] Change Source Folder
echo [2] Change Auto-Cleanup (how many to keep)
echo [B] Back to Menu
echo.
set /p "opt=Choose: "

if /i "%opt%"=="1" (
    set /p "newsrc=Enter new source folder: "
    if exist "%newsrc%" (
        set "BACKUP_SRC=%newsrc%"
        echo Source updated to: %BACKUP_SRC%
    ) else (
        echo Folder not found!
    )
    pause
    goto :DoSettings
)

if /i "%opt%"=="2" (
    set /p "num=Enter number of backups to keep: "
    if not "%num%"=="" set "KEEP_COUNT=%num%"
    echo Auto-clean will keep %KEEP_COUNT% backups.
    pause
    goto :DoSettings
)

goto :BackupMenu





:: --------------- Cleanup Utilities ---------------
:CleanupMenu
cls
call :Banner
if not defined CONFIGURATION_cleanup_days set "CONFIGURATION_cleanup_days=30"
echo.
echo [1] Clean temp folder (older than %CONFIGURATION_cleanup_days% days)
echo [2] Clean all free data
echo [3] Empty Recycle Bin
echo [4] Clear Windows temp
echo [5] Check HDD for errors
echo [6] Check System Files
echo [R] Return
echo.
set /p "choice=Select: "
if /i "%choice%"=="1" goto :CleanTmp
if /i "%choice%"=="2" goto :CleanAllTmp
if /i "%choice%"=="3" goto :EmptyBin
if /i "%choice%"=="4" goto :ClearTemp
if /i "%choice%"=="5" goto :CheckHDD
if /i "%choice%"=="6" goto :CheckSystemFiles
goto :MainMenu



:CleanTmp
call :Log INFO "Cleaning %TEMPORARY_DIR% older than %CONFIGURATION_cleanup_days% days"
forfiles /p "%TEMPORARY_DIR%" /s /d -%CONFIGURATION_cleanup_days% /c "cmd /c echo Deleting: @file & del /f /q @path" 2>nul
forfiles /p "%TEMPORARY_DIR%" /s /d -%CONFIGURATION_cleanup_days% /c "cmd /c rd /s /q @path" 2>nul
pause
goto :CleanupMenu



:CleanAllTmp
call :Log INFO "Cleaning all free data"
echo Securely wipe free space on a drive
echo.
echo WARNING   This will overwrite free space and may take a longer time than expected   WARNING
echo.
set /p "drv=Enter drive letter to clean (e.g. C:): "
if not defined drv goto :CleanupMenu
cipher /w:%drv%:
echo.
pause
goto :CleanupMenu



:EmptyBin
call :Log WARN "Attempt to empty Recycle Bin"
powershell -NoProfile -Command "Clear-RecycleBin -Force" 2>nul
if errorlevel 1 (
    echo PowerShell failed or not supported. Trying manual cleanup...
    for /f "skip=1 tokens=1" %%d in ('wmic logicaldisk get name 2^>nul') do (
        if not "%%d"=="" (
            rd /s /q "%%d\$Recycle.Bin" 2>nul
        )
    )
    echo Recycle Bin emptied (manual).
) else (
    echo Recycle Bin emptied.
)
pause
goto :CleanupMenu



:ClearTemp
call :Log INFO "Clearing TEMP"
del /f /s /q "%TEMP%\*" 2>nul
for /f "delims=" %%d in ('dir /ad /b "%TEMP%"') do rd /s /q "%TEMP%\%%d" 2>nul
echo Done.
pause
goto :CleanupMenu



:CheckHDD
cls
call :Banner
echo Check Disk Utility
echo.
echo WARNING: chkdsk /f may require a reboot if run on the system drive (C:).
echo.
set /p "drv=Enter drive letter to check (e.g. C:): "
if not defined drv goto :CleanupMenu
call :Log INFO "Running chkdsk /f on %drv%"
chkdsk %drv% /f
echo.
pause
goto :CleanupMenu



:CheckSystemFiles
cls
call :Banner
echo System File Checker (sfc /scannow)
echo.
echo This will scan and attempt to repair corrupted Windows system files.
echo Please wait, this may take several minutes...
echo.
pause
call :Log INFO "Running sfc /scannow"
sfc /scannow
echo.
pause
goto :CleanupMenu


:: --------------- AppData Menu ---------------
:AppDataMenu
cls
call :Banner
echo AppData Menu:
echo.
echo [1] Data Folder
echo [2] Logs Folder
echo [3] Temp Folder
echo [T] Terminate All
echo [R] Return
echo.
set /p "adchoice=Select: "
if /i "%adchoice%"=="1" set "adfolder=%DATA_DIR%" & set "adname=Data" & goto :AppDataOps
if /i "%adchoice%"=="2" set "adfolder=%LOG_DIR%" & set "adname=Logs" & goto :AppDataOps
if /i "%adchoice%"=="3" set "adfolder=%TEMPORARY_DIR%" & set "adname=Temp" & goto :AppDataOps
if /i "%adchoice%"=="T" goto :AppDataDeleteAll
if /i "%adchoice%"=="R" goto :MainMenu
goto :MainMenu



:AppDataOps
cls
setlocal EnableDelayedExpansion
call :Banner
echo %adname% Folder: %adfolder%
echo.
echo [1] View files
echo [2] Delete all contents
echo [3] Show directory path
echo [4] Open folder
echo [5] Enter subdirectory
echo [R] Return
set /p "adop=Select: "
if /i "!adop!"=="1" (
  echo Files in %adfolder%:
  dir /b /a:-d "%adfolder%"
  echo.
  set /p "fname=Enter filename to view (blank to cancel): "
  if not defined fname goto :AppDataOps
  if exist "%adfolder%\!fname!" (
    echo Showing contents of !fname!:
    type "%adfolder%\!fname!"
  ) else (
    echo File not found.
  )
  pause
  goto :AppDataOps
)
if /i "!adop!"=="2" (
  echo Deleting all contents in %adfolder%...
  del /f /s /q "%adfolder%\*" 2>nul
  for /f "delims=" %%d in ('dir /ad /b "%adfolder%"') do rd /s /q "%adfolder%\%%d" 2>nul
  echo Done.
  pause
  goto :AppDataOps
)
if /i "!adop!"=="3" echo Directory: %adfolder% & pause & goto :AppDataOps
if /i "!adop!"=="4" start "" "%adfolder%" & goto :AppDataOps
if /i "!adop!"=="5" (
  echo Subdirectories in %adfolder%:
  dir /b /a:d "%adfolder%"
  echo.
  set /p "subdir=Enter subdirectory name (blank to cancel): "
  if not defined subdir goto :AppDataOps
  if exist "%adfolder%\!subdir!" (
    set "adfolder=%adfolder%\!subdir!"
    set "adname=%adname%\!subdir!"
    goto :AppDataOps
  ) else (
    echo Subdirectory not found.
    pause
    goto :AppDataOps
  )
)
if /i "!adop!"=="R" endlocal & goto :AppDataMenu
goto :AppDataOps



:AppDataDeleteAll
cls
call :Banner
echo WARNING: This will delete ALL files and subfolders in:
echo.
echo   %DATA_DIR%
echo   %LOG_DIR%
echo   %TEMPORARY_DIR%
echo.
choice /m "Are you sure you want to delete ALL AppData?"
if errorlevel 2 goto :AppDataMenu
echo Deleting all AppData...
del /f /s /q "%DATA_DIR%\*" 2>nul
for /f "delims=" %%d in ('dir /ad /b "%DATA_DIR%"') do rd /s /q "%DATA_DIR%\%%d" 2>nul
del /f /s /q "%LOG_DIR%\*" 2>nul
for /f "delims=" %%d in ('dir /ad /b "%LOG_DIR%"') do rd /s /q "%LOG_DIR%\%%d" 2>nul
del /f /s /q "%TEMPORARY_DIR%\*" 2>nul
for /f "delims=" %%d in ('dir /ad /b "%TEMPORARY_DIR%"') do rd /s /q "%TEMPORARY_DIR%\%%d" 2>nul
echo Done.
pause
goto :AppDataMenu






:: --------------- Quick Actions (non-interactive) ---------------
:QuickActions
call :LoadConfig >nul 2>&1
call :Log INFO "Quick actions running"
call :SystemSummary
call :DiskSummary
exit /b



:SystemSummary
echo System Summary
wmic cpu get Name,NumberOfCores,NumberOfLogicalProcessors 2>nul | more
wmic os get Caption,Version,BuildNumber,OsArchitecture 2>nul | more
wmic computersystem get Manufacturer,Model,TotalPhysicalMemory 2>nul | more
exit /b



:DiskSummary
for /f "skip=1 tokens=1-3" %%a in ('wmic logicaldisk get name^,freespace^,size 2^>nul') do (
  if not "%%a"=="" (
    set "n=%%a" & set "f=%%b" & set "s=%%c"
    call :HumanSize "!f!" fH
    call :HumanSize "!s!" sH
    echo Drive !n!: Free=!fH! / Size=!sH!
  )
)
exit /b



:HumanSize
REM %1 bytes, %2 outvar
REM NOTE: Divides by chopping 3 digits (~1000 per step, not 1024). Gives an
REM       approximate result — good enough for display, not byte-perfect.
setlocal EnableDelayedExpansion
set "val=%~1"
set "units=Bytes KB MB GB TB"
set /a i=0

REM Simple logic to handle large numbers without 32-bit overflow
:hs_loop
if defined val if "!val:~3!" neq "" (
  set /a i+=1
  set "val=!val:~0,-3!"
  if "!val!"=="" set "val=0"
  if !i! LSS 4 goto :hs_loop
) else if !val! GEQ 1024 (
  set /a i+=1
  set /a val=val/1024
)

for /f "tokens=%i%+1" %%u in ("%units%") do set "unit=%%u"
endlocal & set "%~2=%val% %unit%"
exit /b


:: --------------- Usage ---------------
:Usage
cls
call :Banner
@echo Usage: %~n0 [options]
@echo.
@echo   /?           Show this help
@echo   --help       Same as /?
@echo   /quick       Print a quick system+disk summary and exit
@echo.
@echo Run without arguments for interactive menu.
pause
exit /b


:: --------------- The End ---------------
:End
call :Log INFO "Exiting %APP_NAME%"
if exist "%CRASH_FLAG%" del "%CRASH_FLAG%"
color 07
endlocal
exit /b