<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">


<xsl:template match="/">
    <html>
        <head>
        <title>Search</title>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="search.js"></script>
        </head> 

        <body>

        <div class="jumbotron text-center" style="background-image: url(https://cdn.wallpapersafari.com/96/12/2C4yoJ.jpg)">
            <h1><font color="white">SEARCH</font></h1>
        </div>
        
        
            <h3><a href="https://course-dm2517-ht18.csc.kth.se/~simfors/DM2517/project/coffeedata.php">Back to homepage</a></h3><br/><br/>

        

        <style type = "text/css">
        #myInput {
        background-image: url('/css/searchicon.png'); /* Add a search icon to input */
        background-position: 10px 12px; /* Position the search icon */
        background-repeat: no-repeat; /* Do not repeat the icon image */
        width: 47%; /* Full-width */
        font-size: 16px; /* Increase font-size */
        padding: 12px 20px 12px 40px; /* Add some padding */
        border: 1px solid #ddd; /* Add a grey border */
        margin-bottom: 12px; /* Add some space below the input */
        
        }

        #myTable {
        border-collapse: collapse; /* Collapse borders */
        width: 100%; /* Full-width */
        border: 1px solid #ddd; /* Add a grey border */
        font-size: 18px; /* Increase font-size */
        }

        #myTable th, #myTable td {
        text-align: left; /* Left-align text */
        padding: 12px; /* Add padding */
        }

        #myTable tr {
        /* Add a bottom border to all table rows */
        border-bottom: 1px solid #ddd;
        }

        #myTable tr.header, #myTable tr:hover {
        /* Add a grey background color to the table header and on hover */
        background-color: #ead9c8;
        }

        #myInput2 {
        background-image: url('/css/searchicon.png'); /* Add a search icon to input */
        background-position: 10px 12px; /* Position the search icon */
        background-repeat: no-repeat; /* Do not repeat the icon image */
        width: 47%; /* Full-width */
        font-size: 16px; /* Increase font-size */
        padding: 12px 20px 12px 40px; /* Add some padding */
        border: 1px solid #ddd; /* Add a grey border */
        margin-bottom: 12px; /* Add some space below the input */
        
        }

        </style>
        
        <input type="text" id="myInput2" onkeyup="placessearch()" placeholder="Search for names.."/>
        OR
        <input type="text" id="myInput" onkeyup="locationsearch()" placeholder="Search for location.."/>

        <table id="myTable">
        
        <tr class="header">
            <th style="width:50%;">CoffeePlace</th>
            <th style="width:50%;">Location</th>
        </tr>
        <xsl:apply-templates select="//CoffeePlace"/> 
         
        </table>

        </body>
    </html>
</xsl:template>


<xsl:template match="//placeName"/>

<xsl:template match="//CoffeePlace">
    <tr>
        <td><a href="https://course-dm2517-ht18.csc.kth.se/~simfors/DM2517/project/{placeName}.php"><xsl:value-of select="placeName"/></a></td>
        <td><xsl:value-of select="location"/></td>
    </tr>
</xsl:template>>

<xsl:template match="price">
</xsl:template>

<xsl:template match="offer">
</xsl:template>

<xsl:template match="coffeeCard">
</xsl:template>

</xsl:stylesheet>