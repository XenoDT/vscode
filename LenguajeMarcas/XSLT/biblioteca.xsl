<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" />
  <xsl:template match="/">
    <xsl:text>
    Titulo,Nombre autor,Apellido autor,Editorial,Fecha,Precio,Género
    </xsl:text>
    <xsl:for-each select="biblioteca/libro">
      <xsl:sort select="precio" order="descending">
        
      </xsl:sort>
      <xsl:if test=".[disponible = 'true']">
        

      <xsl:value-of select="@isbn"/>
      <xsl:text>,</xsl:text>
      <xsl:value-of select="titulo"/>
      <xsl:text>,</xsl:text>
      <xsl:value-of select="concat(autor/nombre, ' ' ,autor/apellido)"/>
      <xsl:text>,</xsl:text>
      <xsl:value-of select="editorial"/>
      <xsl:text>,</xsl:text>
      <xsl:value-of select="fecha_publicacion"/>
      <xsl:text>,</xsl:text>
      <xsl:value-of select="precio"/>
      <xsl:text>,</xsl:text>
      <xsl:for-each select="generos/genero">
        <xsl:if test=".">
          <xsl:value-of select="."/>
          <xsl:if test="position() != last()">
            <xsl:text>;</xsl:text>
          </xsl:if>
        </xsl:if>
      </xsl:for-each>
      <xsl:text>,</xsl:text>
      <xsl:if test="disponible">
        <xsl:choose>
          <xsl:when test="disponible = 'true'">
            <xsl:text>Si</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>No</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
      
      <xsl:if test="last()">
        <xsl:text>&#xa;</xsl:text>
      </xsl:if>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>