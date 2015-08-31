<?php
print_r($_GET);
echo'*******';
print_r($_POST);

//require_once('connection.php');

$comments		= $_POST['comment'];
$Name			= $_POST['Name'];

$servername		= 'localhost';
$username		= 'root';
$password		= 'password';
$dbname			= 'webflight_blog'


// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO comments (comments, postedBy)
VALUES ( '$comments', '$Name')";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

?>
;