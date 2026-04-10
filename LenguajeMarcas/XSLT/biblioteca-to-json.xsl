<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" indent="yes"/>
  <xsl:template match="/">
    {
    "biblioteca":{
      <xsl:for-each select="biblioteca/libro">
          "libro":{
              "isbn": "<xsl:value-of select="@isbn"/>",
              "title": "<xsl:value-of select="title"/>",
              "comp.name": "<xsl:value-of select="concat(autor/nombre, ' ', autor/apellido)"/>,
              "editorial": "<xsl:value-of select="editorial"/>",
              "pub.year": "<xsl:value-of select="substring(fecha_publicacion, 1, 4)"/>",
              "precio": "<xsl:value-of select="precio"/>",
              "generos":[
                <xsl:for-each select="generos/genero">
                  "genero": "<xsl:value-of select="."/>"
                  <xsl:if test="position() != last()">
                    ;
                  </xsl:if>
                </xsl:for-each>
              ],
              "disponible":<xsl:choose>
                <xsl:when test="disponible = 'true'">
                  "Si"
                </xsl:when>
                <xsl:otherwise>
                  "no"
                </xsl:otherwise>
              </xsl:choose>
          }<xsl:if test="position() != last()">,</xsl:if>
      </xsl:for-each>
    }
    }
  </xsl:template>
</xsl:stylesheet>