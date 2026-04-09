<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:text>ISBN,Título,Autor,Editorial,Año,Precio,Géneros,Disponible&#10;</xsl:text>
        
        <xsl:for-each select="biblioteca/libro[disponible='true']">
            <xsl:sort select="precio" order="descending" data-type="number"/>
            
            <xsl:value-of select="@isbn"/>,
            <xsl:value-of select="titulo"/>,
            
            <xsl:value-of select="concat(autor/nombre, ' ', autor/apellido)"/>,
            
            <xsl:value-of select="editorial"/>,
            <xsl:value-of select="substring(fecha_publicacion, 1, 4)"/>,
            
            <xsl:value-of select="precio"/>,
            <xsl:for-each select="generos/genero">
                <xsl:value-of select="."/>
                <xsl:if test="position() != last()">;</xsl:if>
            </xsl:for-each>,
            
            <xsl:value-of select="disponible"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>