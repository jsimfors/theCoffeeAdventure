<?xml version="1.0"?>
<?php include('server.php'); ?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">

<xsl:template match="/">

<html>
<head>

<title>Espresso House</title>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="jquery.min.js"></script>
  <script src="scripts.js"></script>


  <meta charset="UTF-8"/>
  <link rel="stylesheet" type="text/css" href="pagestars.css"/>
</head>

<body>

<div class="jumbotron text-center" style="background-image: url(https://cdn.wallpapersafari.com/96/12/2C4yoJ.jpg)">
  <h1><font color="white">Espresso House</font></h1>
</div>


<div class="container">
  <div class="row">
      <div class="col-sm-5">
    <a href="https://course-dm2517-ht18.csc.kth.se/~simfors/DM2517/project/coffeedata.php">Back to homepage</a><br/><br/>
    <xsl:apply-templates select="//CoffeePlace[placeName='Espresso House']"/>
    <h2>Grade</h2>
    <h5><xsl:value-of select="round((sum(//Grade[placeName='Espresso House']/uniqueAvGrade) div count(//Grade[placeName='Espresso House']/uniqueAvGrade)) * 10) div 10" /><br/></h5>
   (<xsl:value-of select="count(//Grade[placeName='Espresso House']/uniqueAvGrade)" /> votes)
  </div>


<div class="col-sm-5">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="espressohouse.jpg" alt="Los Angeles"/>
    </div>

    <div class="item">
      <img src="coffee2.jpg" alt="Chicago"/>
    </div>

    <div class="item">
      <img src="coffee3.jpg" alt="New York"/>
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

</div></div></div>
<xsl:apply-templates select="//signedin"/>

  <h1>Grades</h1>
<xsl:apply-templates select="//Grade[placeName='Espresso House']"/>


</body>
</html>
</xsl:template>

<xsl:template match="//placeName"/>

<xsl:template match="signedin">

    <br/><br/>

    <div class="wrapper">
  	<?php echo $comments; ?>
  	<form class="comment_form">
      <div>
        <b> Have you had a coffee at Espresso House? Grade it!</b>
        <label for="personName">Name:</label>
          <select name="personName" id="personName">
            <option value="Joe" name="personName" id="personName">Joe</option>
            <option value="Moe" name="personName" id="personName">Moe</option>
            <option value="boe" name="personName" id="personName">Boe</option>

          </select>

        <label for="placeName"><b>Place Name: </b>Espresso House</label>
        <input name="placeName" value="Espresso House" id="placeName" readonly="true"></input>
      </div>

      <div>
        <label for="coffeeGrade">Coffee Grade:</label>
            <select name="coffeeGrade" id="coffeeGrade">
              <option value="1" name="coffeeGrade" id="coffeeGrade">1</option>
              <option value="2" name="coffeeGrade" id="coffeeGrade">2</option>
              <option value="3" name="coffeeGrade" id="coffeeGrade">3</option>
              <option value="4" name="coffeeGrade" id="coffeeGrade">4</option>
              <option value="5" name="coffeeGrade" id="coffeeGrade">5</option>
              </select>
      </div>

      <div>
        <label for="priceGrade">Price Grade:</label>
          <select name="priceGrade" id="priceGrade">
            <option value="1" name="priceGrade" id="priceGrade">1</option>
            <option value="2" name="priceGrade" id="priceGrade">2</option>
            <option value="3" name="priceGrade" id="priceGrade">3</option>
            <option value="4" name="priceGrade" id="priceGrade">4</option>
            <option value="5" name="priceGrade" id="priceGrade">5</option>
          </select>

      </div>

      <div>
        <label for="atmosphereGrade">Atmosphere Grade:</label>
          <select  name="atmosphereGrade" id="atmosphereGrade">
            <option value="1" name="atmosphereGrade" id="atmosphereGrade">1</option>
            <option value="2" name="atmosphereGrade" id="atmosphereGrade">2</option>
            <option value="3" name="atmosphereGrade" id="atmosphereGrade">3</option>
            <option value="4" name="atmosphereGrade" id="atmosphereGrade">4</option>
            <option value="5" name="atmosphereGrade" id="atmosphereGrade">5</option>
          </select>
      </div>

      <button type="button" id="submit_btn">GRADE</button>
      <br/>
      <div id="display_area" style="color:#800000;"/>
      <i>Edit a previous grade:    </i>
      <button type="button" id="update_btn">UPDATE</button>
  	</form>
  </div>
    

</xsl:template>


<xsl:template match="//Grade[placeName='Espresso House']">
<div class="comment_box">
        <div class="display_personName"><b>Name: </b><xsl:value-of select="personName"/></div>
  		  <div class="display_coffeeGrade"><b>Coffee Grade: </b><xsl:value-of select="coffeeGrade"/></div>
  		  <div class="display_priceGrade"><b>Price Grade: </b><xsl:value-of select="priceGrade"/></div>
  		  <div class="display_atmosphereGrade"><b>Atmosphere Grade: </b><xsl:value-of select="atmosphereGrade"/></div>


</div>
</xsl:template>

<xsl:template match="price">
    <h2>Price</h2>
    <b>Price small coffee: </b><xsl:apply-templates/>:-
    <br/>
</xsl:template>

<xsl:template match="offer">
    <h2>Offers</h2>
    <xsl:apply-templates/>
</xsl:template>

<xsl:template match="coffeeCard">
    <h2>Coffecard</h2><xsl:apply-templates select="@card" />
</xsl:template>

<xsl:template match="location">
    <h2>Location</h2>
    <xsl:apply-templates/>
</xsl:template>





</xsl:stylesheet>
