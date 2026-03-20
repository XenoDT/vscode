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
      <xsl:for-each select="producto[stock > 10]">
        {
        "Nombre": "<xsl:value-of select="nombre"/>",
        "Marca": "<xsl:value-of select="marca"/>",
        "Precio": <xsl:value-of select="precio"/>,
        "precio_con_iva": <xsl:value-of select="precio * 1.21"/>,
        "Stock": <xsl:value-of select="stock"/>,
        "Especificaciones": {
              <xsl:for-each select="especificaciones/*">
                "<xsl:value-of select="name()"/>": "<xsl:value-of select="."/>"<xsl:if test="position() != last()">,</xsl:if>
              </xsl:for-each>
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