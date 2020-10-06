<?php
   include 'logindetails.php';
   echo $username, $password, $databasename,

   // Connect using host, username, password and databasename
   $link = mysqli_connect('xml.csc.kth.se', $username, $password, $databasename);
   session_start();
   
   $user_check = $_SESSION['login_user'];
   
   $ses_sql = mysqli_query($link,"select username from users where username = '$user_check' ");
   
   $row = mysqli_fetch_array($ses_sql,MYSQLI_ASSOC);
   
   $login_session = $row['username'];

   if(isset($_SESSION['login_user'])){
      print utf8_encode('<signedin/>');
   }
   else {
      print utf8_encode("<notsignedin/>");
   }