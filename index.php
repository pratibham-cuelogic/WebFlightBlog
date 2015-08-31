<?php
  require_once('connection.php');
  echo'here';
  print_r($_GET['controller']);
  exit;

   if (isset($_GET['controller']) && isset($_GET['action'])) {
    $controller = $_GET['controller'];
    $action     = $_GET['action'];
  } else {
    $controller = 'pages';
    $action     = 'home';
  }

  require_once('views/layout.php');

?>