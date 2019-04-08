<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>LearningFuze</title>
</head>

<body>
    <h1>LearningFuze</h1>
    <h4>Attempting MySQL connection from PHP...</h4>
    <?php

    $host = 'localhost';
    $user = 'root';
    $pass = 'root';
    $conn = new mysqli($host, $user, $pass);

    if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
    }

    ?>
    Connected to MySQL successfully!
</body>
</html>
