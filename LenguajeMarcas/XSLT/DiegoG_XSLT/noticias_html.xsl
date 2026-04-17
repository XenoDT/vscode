<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" encoding="UTF-8"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Noticias</title>
        <style>
         .primero { background-color: green; }
          .ultimo-titulo { background-color: green; }
          table { border-collapse: collapse; width: 100%; }
          th, td { border: 1px solid black; padding: 8px; text-align: left; }
          tfoot { font-weight: bold; background-color: #f2f2f2; } 
        </style>  
      </head>
      <body>
        <table>
          <thead>
            <legend>hay <xsl:value-of select="count(//noticia)"/> noticias</legend>
            <tr>
              <th>Títilo</th>  
              <th>Autoría</th>  
              <th>Vistas</th>  
            </tr> 
          </thead>
          <tbody>
            
            <xsl:for-each select="portal/noticia">
              <xsl:sort select="@vistas" order="descending" data-type="number"/>  
              <tr>
                <xsl:if test="@importancia = 'alta'">
                  <xsl:attribute name="class">primero</xsl:attribute>
                </xsl:if>
                <td><xsl:value-of select="titulo"/></td>  
                <td><xsl:value-of select="autoria"/></td>  
                <td><xsl:value-of select="@vistas"/></td>  
              </tr>
            </xsl:for-each>  
          </tbody>
          <tfoot>
            <tr>
              <td colspan="2">Total de vistas</td>  
              <td><xsl:value-of select="sum(//@vistas)"/></td>  
            </tr>  
          </tfoot>
        </table>
      </body>
    </html>
  </xsl:template>

  

</xsl:stylesheet>