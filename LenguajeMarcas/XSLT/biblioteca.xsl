<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" />
  <xsl:template match="/">
    Titulo,Nombre autor,Apellido autor,Editorial,Fecha,Precio,Género
    <xsl:for-each select="biblioteca/libro">
      <xsl:value-of select="@isbn"/>,<xsl:value-of select="titulo"/>,<xsl:value-of select="autor/nombre"/>,<xsl:value-of select="autor/apellido"/>,<xsl:value-of select="editorial"/>,<xsl:value-of select="fecha_publicacion"/>,<xsl:value-of select="precio"/>,<xsl:for-each select="generos/genero">
        <xsl:value-of select="."/>,<xsl:value-of select="disponible"/>        
      </xsl:for-each>.


    </xsl:for-each>
    <xsl:value-of select="biblioteca/libro/titulo"/>,<xsl:value-of select="biblioteca/libro/autor/nombre"/>,
  </xsl:template>
</xsl:stylesheet>