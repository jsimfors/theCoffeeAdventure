<?php 
	include 'logindetails.php';
	echo $username, $password, $databasename,

	// Connect using host, username, password and databasename
	$link = mysqli_connect('xml.csc.kth.se', $username, $password, $databasename);
	
  if (!$conn) {
    die('Connection failed ' . mysqli_error($conn));
  }
  if (isset($_POST['save'])) {
	$placeName = $_POST['placeName'];
    $personName = $_POST['personName'];
  	$coffeeGrade = $_POST['coffeeGrade'];
  	$priceGrade = $_POST['priceGrade'];
  	$atmosphereGrade = $_POST['atmosphereGrade'];
	$uniqueAvGrade = (intval($coffeeGrade) + intval($priceGrade) + intval($atmosphereGrade))/3;

	$sql = "INSERT INTO Grade (placeName, personName, coffeeGrade, priceGrade, atmosphereGrade, uniqueAvGrade) 
	VALUES ('{$placeName}', '{$personName}', '{$coffeeGrade}', '{$priceGrade}', '{$atmosphereGrade}', '{$uniqueAvGrade}')";
	  
	  if (mysqli_query($conn, $sql)) {
  	  $id = mysqli_insert_id($conn);
       $saved_comment = '<div class="comment_box">
       		<span class="delete" data-id="' . $id . '" >delete</span>
       		<span class="edit" data-id="' . $id . '">edit</span>
       		<div class="display_placeName">'. $placeName .'</div>
			<div class="display_personName">'. $personName .'</div>
			<div class="display_coffeeGrade">'. $coffeeGrade .'</div>
       		<div class="display_priceGrade">'. $priceGrade .'</div>
			<div class="display_atmosphereGrade">'. $atmosphereGrade .'</div>
       	</div>';
		//echo $saved_comment;
		echo "Grade saved!";
  	}else {
  	  echo "Error: you have already voted! Use the 'UPDATE' button.";
	  }
  	exit();
  }
  
  // delete comment fromd database
  if (isset($_GET['delete'])) {
  	$id = $_GET['id'];
  	$sql = "DELETE FROM Grade WHERE id=" . $id;
  	mysqli_query($conn, $sql);
  	exit();
  }

  // update comment database: 

  if (isset($_POST['update'])) {
	$id = $_POST['id'];
	$placeName = $_POST['placeName'];
  	$personName = $_POST['personName'];
  	$coffeeGrade = $_POST['coffeeGrade'];
	$priceGrade = $_POST['priceGrade'];
	$atmosphereGrade = $_POST['atmosphereGrade'];
	$uniqueAvGrade = (intval($coffeeGrade) + intval($priceGrade) + intval($atmosphereGrade))/3;


	$sql2 = "UPDATE Grade SET coffeeGrade='{$coffeeGrade}', priceGrade='{$priceGrade}', atmosphereGrade='{$atmosphereGrade}', 
	uniqueAvGrade='{$uniqueAvGrade}' WHERE placeName='{$placeName}' AND personName='{$personName}'";
	  
	  if (mysqli_query($conn, $sql2)) {
  	  $id = mysqli_insert_id($conn);
       $saved_comment = '<div class="comment_box">
       		<span class="delete" data-id="' . $id . '" >delete</span>
       		<span class="edit" data-id="' . $id . '">edit</span>
       		<div class="display_placeName">'. $placeName .'</div>
			<div class="display_personName">'. $personName .'</div>
			<div class="display_coffeeGrade">'. $coffeeGrade .'</div>
       		<div class="display_priceGrade">'. $priceGrade .'</div>
			<div class="display_atmosphereGrade">'. $atmosphereGrade .'</div>
       	</div>';
		//echo $saved_comment;
		echo "Grade updated!";
  	}else {
  	  echo "Error: No grade under that name found. Use the 'GRADE' button.";
	  }
  	exit();
  }


?>

