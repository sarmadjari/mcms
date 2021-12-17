<?php
 $dbhost    = "db-mysql-d1";
 $dbuser    = "customers_mngr";
 $dbpass    = "my-secret-pw";
 $dbname    = "customers_db";


$con = mysqli_connect($dbhost, $dbuser, $dbpass , $dbname) or die($con);

?>