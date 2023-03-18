<?php
$servername = "localhost";
$username = "sidalah1";
$password = "sidalah2017";
$db = "zhiemy";
// Create connection
$koneksi = new mysqli($servername, $username, $password, $db);

// Check connection
if ($koneksi->connect_error) {
  die("Connection failed: " . $koneksi->connect_error);
}
