<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">




<xsl:template match="/">
<html>
<head>
<title>The Big Coffee Adventure:</title>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<style>
a {
  color: black;
}
.not-checked {
  color: #ead9c8;
  font-size:20px;
}

.checked {
  color: #6f4d2a;
  font-size:20px;
}

button {
  padding: 60px 170px 8px 32px;
  font-family: Arial, Verdana;   
  background: #ead9c8 url(https://i.ibb.co/8B02kYH/coffeesearch3.png) 10px 10px no-repeat;
  background-position: center;
  background-repeat: no-repeat;
  border: none;
  color: #281c11;
  text-align: right;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;

}


</style>

</head> 


<body>

<div class="jumbotron text-center" style="background-image: url(https://cdn.wallpapersafari.com/96/12/2C4yoJ.jpg)">
  <h1><font color="white">The Big Coffee Adventure!!!!</font></h1>
  <p><font color="white">With Joe and Moe!!!</font></p>
</div>


<center>
<div class="container">
  <div class="row">
    <xsl:apply-templates select="//CoffeePlace" />
  </div>
</div>


<button onclick="window.location.href = 'https://course-dm2517-ht18.csc.kth.se/~simfors/DM2517/project/search.php';"></button>
<br/>
<br/>
<br/>
<br/>


<center><h1>Login</h1>
If your either Joe, Moe or Boe you can sign in here</center>
<xsl:apply-templates select="//loginstart" />

</center>



</body>
</html>
</xsl:template>

<xsl:template match="//CoffeePlace">
    <div class="col-sm-4">

      <h3><a href="https://course-dm2517-ht18.csc.kth.se/~simfors/DM2517/project/{placeName}.php"><xsl:value-of select="placeName"  /></a></h3>
      <p><b>Price small coffee: </b><xsl:value-of select="price" />:-</p>
      <p><b>Grade: </b>

      <xsl:variable name="placenameVar" select="placeName"/>



    <xsl:choose>
        <xsl:when test="round(sum(..//Grade[placeName=$placenameVar]/uniqueAvGrade) div count(//Grade[placeName=$placenameVar]/uniqueAvGrade)) = 1">
          <i class="fa fa-coffee checked"></i>
          <i class="fa fa-coffee not-checked"></i>
          <i class="fa fa-coffee not-checked"></i>
          <i class="fa fa-coffee not-checked"></i>
          <i class="fa fa-coffee not-checked"></i>
          </xsl:when>

        <xsl:when test="round(sum(..//Grade[placeName=$placenameVar]/uniqueAvGrade) div count(//Grade[placeName=$placenameVar]/uniqueAvGrade)) = 2">
          <i class="fa fa-coffee checked"></i>
          <i class="fa fa-coffee checked"></i>
          <i class="fa fa-coffee not-checked"></i>
          <i class="fa fa-coffee not-checked"></i>
          <i class="fa fa-coffee not-checked"></i>
          </xsl:when>


        <xsl:when test="round(sum(..//Grade[placeName=$placenameVar]/uniqueAvGrade) div count(//Grade[placeName=$placenameVar]/uniqueAvGrade)) = 3">
          <i class="fa fa-coffee checked"></i>
          <i class="fa fa-coffee checked"></i>
          <i class="fa fa-coffee checked"></i>
          <i class="fa fa-coffee not-checked"></i>
          <i class="fa fa-coffee not-checked"></i>
        </xsl:when>

        <xsl:when test="round(sum(..//Grade[placeName=$placenameVar]/uniqueAvGrade) div count(//Grade[placeName=$placenameVar]/uniqueAvGrade)) = 4">
          <i class="fa fa-coffee checked"></i>
          <i class="fa fa-coffee checked"></i>
          <i class="fa fa-coffee checked"></i>
          <i class="fa fa-coffee checked"></i>
          <i class="fa fa-coffee not-checked"></i>
          </xsl:when>

         <xsl:otherwise>
          <i class="fa fa-coffee checked"></i>
          <i class="fa fa-coffee checked"></i>
          <i class="fa fa-coffee checked"></i>
          <i class="fa fa-coffee checked"></i>
          <i class="fa fa-coffee checked"></i>
          
         </xsl:otherwise>
       </xsl:choose>




      </p>
      <br/>
      <br/>
    </div>
</xsl:template>


<xsl:template match="//signedin">
<center>AHPAHPAHP! Du är redan inloggad</center><br/><br/>
</xsl:template>

<xsl:template match="//notsignedin">

</xsl:template>

<xsl:template match="//loginstart">

<style type = "text/css">
         body {
            font-family:Arial, Helvetica, sans-serif;
            font-size:14px;
         }
         label {
            font-weight:bold;
            width:100px;
            font-size:14px;
         }
         .box {
            border:#666666 solid 1px;
         }
      </style>
	
      <div align = "center">
         <div style = "width:300px; border: solid 1px #333333; " align = "left">
            <div style = "background-color:#333333; color:#FFFFFF; padding:3px;"><b>Login</b></div>
				
            <div style = "margin:30px">
            <xsl:apply-templates select="//signedin"/>
               
               <form action = "coffeedata.php?stu" method = "post">
                  <label>UserName  :</label><input type = "text" name = "username" class = "box"/><br /><br />
                  <label>Password  :</label><input type = "password" name = "password" class = "box" /><br/><br />
                  <input type = "submit" value = " Login "/><br />
               </form>
               
               <div style = "font-size:11px; color:#cc0000; margin-top:10px"><?php echo $error; ?></div>

               <xsl:apply-templates select="loginuser"/>
					<xsl:apply-templates select="error"/>
               <a href = "logout.php">Sign Out</a>

            </div>
				
         </div>
			
      </div>

</xsl:template>

<xsl:template match="//loginuser">
Jaha, hej du! Nu är du inloggad<br/>
</xsl:template>

<xsl:template match="//error">
Nähä du, det där gick inte
</xsl:template>

</xsl:stylesheet>
