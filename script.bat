@echo off

:: Set the directory where this batch script is located
set "script_dir=%~dp0"
echo 
:: Set the path to the pdftopng executable in the same directory as the script
set "pdftopng_path=%script_dir%pdftopng.exe"
set "cwebp_path=%script_dir%cwebp.exe"

:: Set the input PDF directory (the "pdfs" folder)
set "input_pdf_directory=%script_dir%pdfs"

:: Set the output directory for PNG images (create an "images" folder in the script directory)
set "output_directory=%script_dir%images"

:: Ensure the output directory exists; create it if not
if not exist "%output_directory%" mkdir "%output_directory%"
@REM pdftopng

@REM :: Loop through all PDF files in the "pdfs" folder and convert each one to PNG
@REM for %%i in ("%input_pdf_directory%\*.pdf") do (

@REM     set "pdf_file=%%~nxi"
@REM     echo Converting "%%~nxi" to PNG...
@REM     echo %pdf_file%

@REM     pdftopng.exe -r 102 "%input_pdf_directory%\%pdf_file%" "%output_directory%\%%~nxi_page"

@REM )

:: Loop through all PNG files in the "images" folder and convert each one to WebP
for %%f in ("%output_directory%\*.png") do (
    set "png_file=%%~nxf"
    set "webp_file=%output_directory%\%%~nf.webp"
    echo Converting "%%~nxf" to WebP...
    %cwebp_path% -q 90 -z 4 "%%f" -o "%%~dpnf.webp"
    
    :: Delete the original PNG file after successful conversion to WebP
    del "%%f"
)

@REM echo All PDFs in the "pdfs" folder converted to PNG.

@REM @echo off

@REM :: Add all changes to the staging area
@REM git add .

@REM :: Prompt the user for a commit message
@REM set /p commit_message="Enter your commit message: "

@REM :: Commit the changes with the provided commit message
@REM git commit -m "%commit_message%"

@REM :: Push the changes to the remote repository (replace "origin" and "master" with your remote and branch)
@REM git push origin main

:: Pause to keep the command prompt window open for feedback
pause