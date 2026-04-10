<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Mis songes favoritas</title>  
      </head>
      <body>
        <h1>Mis songes favoritas</h1>
        <ul>
        <xsl:for-each select="songs/song[ year &gt; 1]">
          <xsl:sort select="year" order="descending"></xsl:sort>
            <li>Cancion:<xsl:value-of select="concat(' ', title, ' ', artist, ' ', year)"/></li> 
        </xsl:for-each>
        </ul>
        <p>
          Suma: <xsl:value-of select="sum(//year)"/>
          <br></br>
        Media: <xsl:value-of select="round( sum(//year) div(count(//year)))"/>
        </p>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>