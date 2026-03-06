<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  
  <xsl:template match="/">
    <html>
      <head>
        <title>PlayList</title>
        <style>
          body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f9; }
          h2 { color: #333; text-align: center; }
          table { width: 100%; border-collapse: collapse; background: white; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
          th, td { padding: 12px; border: 1px solid #ddd; text-align: left; }
          th { background-color: #4CAF50; color: white; }
          tr:nth-child(even) { background-color: #f2f2f2; }
          .badge { padding: 4px 8px; border-radius: 4px; font-size: 0.8em; font-weight: bold; }
          .pegi { background: #ffcc00; color: black; }
          .lang { background: #2196F3; color: white; }
        </style>
      </head>
      <body>
        <h2>Peliculas</h2>
        <table>
          <tr>
            <th>Titulo</th>
            <th>Director</th>
            <th>Año</th>
            <th>Duracion</th>
            <th>Clasificacion</th>
          </tr>
          <xsl:for-each select="movies/movie">
            <xsl:sort select="year" order="descending" data-type="number"/>
            
            <tr>
              <xsl:if test="country">
                <xsl:choose>
                  <xsl:when test="country='Argentina'">
                    <td><strong>Titulo: <xsl:value-of select="title"/></strong></td>
                    <td><strong>Director: <xsl:value-of select="director"/></strong></td>
                    <td><strong>Año: <xsl:value-of select="year"/></strong></td>
                    <td><xsl:if test="duration">
                        <strong><em>Duracion:</em>
                        <xsl:choose>
                          <xsl:when test="duration&lt;=105">
                            Corta
                          </xsl:when>
                          <xsl:when test="duration&gt;105 and duration&lt;120">
                            Media
                          </xsl:when>
                          <xsl:when test="duration&gt;120">
                            Larga
                          </xsl:when>
                        </xsl:choose></strong>
                      </xsl:if></td>
                    <td><strong><xsl:value-of select="genre"/></strong></td>
                  </xsl:when>
                  <xsl:otherwise>
                    <td>Titulo: <xsl:value-of select="title"/></td>
                    <td>Director: <xsl:value-of select="director"/></td>
                    <td>Año: <xsl:value-of select="year"/></td>
                    <td><xsl:if test="duration">
                        <em>Duracion:</em>
                        <xsl:choose>
                          <xsl:when test="duration&lt;=105">
                            Corta
                          </xsl:when>
                          <xsl:when test="duration&gt;105 and duration&lt;120">
                            Media
                          </xsl:when>
                          <xsl:when test="duration&gt;120">
                            Larga
                          </xsl:when>
                        </xsl:choose>
                      </xsl:if></td>
                    <td><xsl:value-of select="genre"/></td>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
              
            </tr>
            
          </xsl:for-each>
        </table>
      </body>
    </html> 
  </xsl:template>
  
  
  
</xsl:stylesheet>