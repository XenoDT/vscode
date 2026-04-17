<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" indent="yes"/>
  <xsl:template match="/">
    <xsl:text>Título,Autoría,Contenido,Longitud,Vistas</xsl:text>
    <xsl:for-each select="portal/noticia[@importancia = 'alta']">
"<xsl:value-of select="titulo"/>","<xsl:value-of select="autoria"/>","<xsl:value-of select="substring(contenido,1,10)"/>","<xsl:value-of select="string-length(contenido)"/>","<xsl:value-of select="@vistas"/>"
    </xsl:for-each>
  </xsl:template>

  

</xsl:stylesheet>