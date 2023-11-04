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
@REM     set "pdf_file_name=%%~ni"
@REM     set "sub_directory=%output_directory%\%pdf_file_name%"
@REM     if not exist "%sub_directory%" mkdir "%sub_directory%"
@REM     @REM echo Created subdirectory: "!sub_directory!"    echo "%%i"
@REM     @REM echo Converting "%%~nxi" to PNG...
@REM     @REM pdftopng.exe -r 150 "%input_pdf_directory%\%pdf_file%" "%sub_directory%\%%~ni"

@REM     :: Loop through all PNG files in the "images" folder and convert each one to WebP
@REM     for %%f in ("%sub_directory%\*.png") do (
@REM         set "png_file=%%~nxf"
@REM         set "webp_file=%output_directory%\%%~nf.webp"
@REM         echo Converting "%%~nxf" to WebP...
@REM         %cwebp_path% -q 90 -z 4 "%%f" -o "%%~dpnf.webp"
        
@REM         :: Delete the original PNG file after successful conversion to WebP
@REM         del "%%f"
@REM     )
@REM )



echo All PDFs in the "pdfs" folder converted to PNG.

@echo off

:: Add all changes to the staging area
git add .

:: Prompt the user for a commit message
set /p commit_message="Enter your commit message: "

:: Commit the changes with the provided commit message
git commit -m "%commit_message%"

git config --global user.email "Ataratheweddingprops@gmail.com"
git config --global user.name "Ataratheweddingprops"

:: Push the changes to the remote repository (replace "origin" and "master" with your remote and branch)
git push origin main

:: Pause to keep the command prompt window open for feedback
pause