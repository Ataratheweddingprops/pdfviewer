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
pdftopng

:: Loop through all PDF files in the "pdfs" folder and convert each one to PNG
for %%i in ("%input_pdf_directory%\*.pdf") do (

    set "pdf_file=%%~nxi"
    echo Converting "%%~nxi" to PNG...
    echo %pdf_file%

    pdftopng.exe -r 200 "%input_pdf_directory%\%pdf_file%" "%output_directory%\%%~nxi_page"

)

:: Loop through all PNG files in the "images" folder and convert each one to WebP
for %%f in ("%output_directory%\*.png") do (
    set "png_file=%%~nxf"
    set "webp_file=%output_directory%\%%~nf.webp"
    echo Converting "%%~nxf" to WebP...
    %cwebp_path% -q 90 -z 4 "%%f" -o "%%~dpnf.webp"
    
    :: Delete the original PNG file after successful conversion to WebP
    del "%%f"
)

echo All PDFs in the "pdfs" folder converted to PNG.

@echo off

:: Add all changes to the staging area
git add .

:: Prompt the user for a commit message
set /p commit_message="Enter your commit message: "

:: Commit the changes with the provided commit message
git commit -m "%commit_message%"

:: Push the changes to the remote repository (replace "origin" and "master" with your remote and branch)
git push origin main

:: Pause to keep the command prompt window open for feedback
pause