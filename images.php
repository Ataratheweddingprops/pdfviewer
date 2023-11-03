<?php
// Path to the folder containing your images
$imageFolder = "images/";

// Get a list of image files in the folder
$imageFiles = glob($imageFolder . "*.{jpg,jpeg,png,gif}", GLOB_BRACE);

// Loop through the image files and generate HTML to display them
foreach ($imageFiles as $imageFile) {
    echo '<img src="' . $imageFile . '" alt="Image" />';
}
?>
