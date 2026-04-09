<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8"/>
  
  <xsl:template match="/">
    {
    "tienda": "<xsl:value-of select="catalogo/@tienda"/>",
    "categorias": [
    <xsl:for-each select="catalogo/categoria">
      {
      "id": "<xsl:value-of select="@id"/>",
      "nombre": "<xsl:value-of select="@nombre"/>",
      "productos": [
      <xsl:for-each select="producto[stock > 10]">
        {
        "id": "<xsl:value-of select="@id"/>",
        "nombre": "<xsl:value-of select="nombre"/>",
        "marca": "<xsl:value-of select="marca"/>",
        "precio": <xsl:value-of select="precio"/>,
        "stock": <xsl:value-of select="stock"/>,
        "precio_con_iva": <xsl:value-of select="precio * 1.21"/>,
        "etiquetas": [
        <xsl:for-each select="etiquetas/etiqueta">
          "<xsl:value-of select="."/>"<xsl:if test="position() != last()">,</xsl:if>
        </xsl:for-each>
        ],
        "especificaciones": {
        <xsl:for-each select="especificaciones/*">
          "<xsl:value-of select="name()"/>": "<xsl:value-of select="."/>"<xsl:if test="position() != last()">,</xsl:if>
        </xsl:for-each>
        }
        }<xsl:if test="position() != last()">,</xsl:if>
      </xsl:for-each>
      ]
      }<xsl:if test="position() != last()">,</xsl:if>
    </xsl:for-each>
    ]
    }
  </xsl:template>
</xsl:stylesheet>