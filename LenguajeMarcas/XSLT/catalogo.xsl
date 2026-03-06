<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"/>
  <xsl:template match="/">
    {
    "catalogo":{
    "categoria":{
    <xsl:for-each select="catalogo/categoria">
      "Producto":{
      <xsl:for-each select="./producto">
        "Nombre": "<xsl:value-of select="nombre"/>",
        "Marca": "<xsl:value-of select="marca"/>",
        "Precio": "<xsl:value-of select="precio"/>",
        "Stock": "<xsl:value-of select="stock"/>"
        "Especificaciones":{
        
        <xsl:choose>
          <xsl:when test="../@id='electronica'">
            <xsl:if test="especificaciones/pantalla">
              "Pantalla": "<xsl:value-of select="especificaciones/pantalla"/>",
            </xsl:if>
            <xsl:if test="especificaciones/ram">
              "Ram": "<xsl:value-of select="especificaciones/ram"/>"
            </xsl:if>
            <xsl:if test="especificaciones/almacenamiento">
              "Almacenamiento": "<xsl:value-of select="especificaciones/almacenamiento"/>",
            </xsl:if>   
            <xsl:if test="especificaciones/tipo">
              "Tipo": <xsl:value-of select="especificaciones/tipo"/>,
            </xsl:if>
            <xsl:if test="especificaciones/autonomia">
            "Autonomia": "<xsl:value-of select="especificaciones/autonomia"/>"
            </xsl:if>
          </xsl:when>
          <xsl:when test="../@id">
            "Potencia": "<xsl:value-of select="especificaciones/potencia"/>"
            "Autonomia": "<xsl:value-of select="especificaciones/autonomia"/>"
          </xsl:when>
        </xsl:choose>
        },
        <xsl:if test="./etiquetas">
          "Etiquetas":{
          <xsl:for-each select="etiquetas/etiqueta">
            <xsl:choose>
              <xsl:when test="last()">
                "Etiqueta": "<xsl:value-of select="."/>"
              </xsl:when>
              <xsl:otherwise>
                "Etiqueta": "<xsl:value-of select="."/>",
              </xsl:otherwise>
            </xsl:choose>
            
          </xsl:for-each>
          }
        </xsl:if>
      </xsl:for-each>},
    </xsl:for-each>
    }
    }
    }
  </xsl:template>
</xsl:stylesheet>             