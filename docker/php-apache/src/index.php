<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index</title>
</head>
<body>
<code>
<?php
// Get the current directory
$directory = './'; // You can change this to the desired directory

// Get the list of files and directories
$contents = scandir($directory);

// Display the list with file/directory indication
foreach ($contents as $item) {
    // Ignore special directories "." and ".."
    if ($item != "." && $item != "..") {
        // Check if it's a file or directory
        if (is_file($directory . $item)) {
            echo $item . ' (File)<br>';
        } elseif (is_dir($directory . $item)) {
            echo $item . ' (Directory)<br>';
        } else {
            echo $item . ' (Unknown)<br>';
        }
    } else {
        echo $item . '<br>';
    }
}
?>
</code>
</body>
</html>
