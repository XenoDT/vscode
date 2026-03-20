<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8"/>
  
  <xsl:template match="/">
    {
    "Tienda": "<xsl:value-of select="catalogo/@tienda"/>",
    "Categorias": [
    <xsl:for-each select="catalogo/categoria">
      {
      "Id": "<xsl:value-of select="@id"/>",
      "Nombre": "<xsl:value-of select="@nombre"/>",
      "Productos": [
      <xsl:for-each select="producto">
        {
        "Nombre": "<xsl:value-of select="nombre"/>",
        "Marca": "<xsl:value-of select="marca"/>",
        "Precio": <xsl:value-of select="precio"/>,
        "Stock": <xsl:value-of select="stock"/>,
        "Especificaciones": {
        <xsl:choose>
          <xsl:when test="../@id='electronica'">
            <xsl:if test="especificaciones/pantalla">"Pantalla": "<xsl:value-of select="especificaciones/pantalla"/>"<xsl:if test="especificaciones/ram or especificaciones/almacenamiento or especificaciones/tipo or especificaciones/autonomia">,</xsl:if></xsl:if>
            <xsl:if test="especificaciones/ram">"Ram": "<xsl:value-of select="especificaciones/ram"/>"<xsl:if test="especificaciones/almacenamiento or especificaciones/tipo or especificaciones/autonomia">,</xsl:if></xsl:if>
            <xsl:if test="especificaciones/almacenamiento">"Almacenamiento": "<xsl:value-of select="especificaciones/almacenamiento"/>"<xsl:if test="especificaciones/tipo or especificaciones/autonomia">,</xsl:if></xsl:if>
            <xsl:if test="especificaciones/tipo">"Tipo": "<xsl:value-of select="especificaciones/tipo"/>"<xsl:if test="especificaciones/autonomia">,</xsl:if></xsl:if>
            <xsl:if test="especificaciones/autonomia">"Autonomia": "<xsl:value-of select="especificaciones/autonomia"/>"</xsl:if>
          </xsl:when>
          <xsl:otherwise>
            "Potencia": "<xsl:value-of select="especificaciones/potencia"/>",
            "Autonomia": "<xsl:value-of select="especificaciones/autonomia"/>"
          </xsl:otherwise>
        </xsl:choose>
        }
        <xsl:if test="etiquetas">
          ,"Etiquetas": [
          <xsl:for-each select="etiquetas/etiqueta">
            "<xsl:value-of select="."/>"<xsl:if test="position() != last()">,</xsl:if>
          </xsl:for-each>
          ]
        </xsl:if>
        }<xsl:if test="position() != last()">,</xsl:if>
      </xsl:for-each>
      ]
      }<xsl:if test="position() != last()">,</xsl:if>
    </xsl:for-each>
    ]
    }
  </xsl:template>
</xsl:stylesheet>