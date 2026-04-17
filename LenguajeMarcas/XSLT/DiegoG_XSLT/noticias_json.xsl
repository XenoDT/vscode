<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:output method="text" indent="yes"/>
<xsl:template match="/">
    {
    <xsl:text>"portal":</xsl:text>[
        <xsl:for-each select="portal/noticia">
      { 
              "titulo": "<xsl:value-of select="titulo"/>",
              "autoria": "<xsl:value-of select="autoria"/>",
              "contenido": "<xsl:value-of select="contenido"/>",
              "longitud": "<xsl:value-of select="string-length(contenido)"/>",
              "adicional":{
                "importancia": <xsl:choose>
                  <xsl:when test="@importancia = 'alta'">
                    1
                  </xsl:when>
                  <xsl:when test="@importancia = 'media'">
                    2
                  </xsl:when>
                  <xsl:otherwise>
                    3
                  </xsl:otherwise>
                </xsl:choose>,
                "vistas": "<xsl:value-of select="@vistas"/>"
              }
      } 
        <xsl:if test="position() != last()">,</xsl:if>
        </xsl:for-each>
      
    ]
    }
  </xsl:template>

  

</xsl:stylesheet>