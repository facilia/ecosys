@echo off

if not "%1"=="" (
	cd "/D %~d0%~p0"
)

set startup_update=%appdata%\${project.name} ${parsedVersion.majorVersion}.${parsedVersion.minorVersion}\startup.txt
set install=startup.txt

if not exist "%startup_update%" (
     set startup=%install%
) else (
     set startup=%startup_update%
)

for %%F in ("%startup%") do (
     for /F "usebackq tokens=1 delims=|" %%J in (%%F) do (
      set memsize=%%J
    )
)

if "%1"=="" (
	start "" java\bin\javaw.exe -server -XX:MaxInlineSize=128 -XX:InlineSmallCode=1024 -Xms32m -Xmx%memsize%m -XX:+UseCodeCacheFlushing -XX:ReservedCodeCacheSize=256m -jar startup.jar 
) else ( 
	start "" java\bin\javaw.exe -server -XX:MaxInlineSize=128 -XX:InlineSmallCode=1024 -Xms32m -Xmx%memsize%m -XX:+UseCodeCacheFlushing -XX:ReservedCodeCacheSize=256m -jar startup.jar "%1" "%2" "%3" "%4" "%5" "%6" "%7" "%8" "%9"
)
