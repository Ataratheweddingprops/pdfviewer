@echo off

:: Set the directory where this batch script is located
set "script_dir=%~dp0"

:: Set the path to the pdftopng executable in the same directory as the script
set "pdftopng_path=%script_dir%pdftopng.exe"

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

    pdftopng.exe -r 300 "%input_pdf_directory%\%pdf_file%" "%output_directory%\%%~nxi_page"
)

echo All PDFs in the "pdfs" folder converted to PNG.

