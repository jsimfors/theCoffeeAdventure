<?php header("Content-type: text/xml; charset=utf-8"); ?>
<?xml-stylesheet type="text/xsl" href="search.xsl"?>
<!DOCTYPE CoffeePlaces SYSTEM "http://course-dm2517-ht18.csc.kth.se/~simfors/DM2517/project/CoffeePlaces.dtd">

<coffeelist>
<?php
    include 'logindetails.php';
    echo $username, $password, $databasename,;

    // Connect using host, username, password and databasename
    $link = mysqli_connect('xml.csc.kth.se', $username, $password, $databasename);
    include_once('session.php');

    // Check connection
    if (mysqli_connect_errno()) {
        printf("Connect failed: %s\n", mysqli_connect_error());
        exit();
    }

    // The SQL query
    $query = " SELECT placeName, price, location, offer, coffeeCard FROM CoffeePlace;";


    // Execute the query
    if (($result = mysqli_query($link, $query)) === false) {
       printf("Query failed: %s<br />\n%s", $query, mysqli_error($link));
       exit();
    }


    $returnstring = '';
    // Loop over the resulting lines
    while ($line = $result->fetch_object()) {
        // Store results from each row in variables
        $placeName = $line->placeName;
        $price = $line->price;
        $location = $line->location;
        $offer = $line->offer;
        $card = $line->coffeeCard;

        // Store the result we want by appending strings to the variable $returnstring
        $returnstring .= "<CoffeePlace>";
        $returnstring .= "<placeName>$placeName</placeName>";
        $returnstring .= "<price>$price</price>";
        $returnstring .= "<location>$location</location>";
        $returnstring .= "<offer>$offer</offer>";
        $returnstring .= "<coffeeCard card='$card'></coffeeCard>";
        $returnstring .= "</CoffeePlace>";
    }

    // Free result and just in case encode result to utf8 before returning
    mysqli_free_result($result);
    print utf8_encode($returnstring);

?>
</coffeelist>