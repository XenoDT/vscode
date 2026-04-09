<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" />
    <xsl:template match="/">
        <xsl:text>ISBN,Título,Autor,Editorial,Año,Precio,Géneros,Disponible&#xa;</xsl:text>
        <xsl:for-each select="biblioteca/libro">
            <xsl:sort select="precio" order="descending" data-type="number"/>
            <xsl:if test="disponible='true'">
            <xsl:value-of select="@isbn" />
            <xsl:text>,</xsl:text>
            <xsl:value-of select="titulo" />
            <xsl:text>,</xsl:text>
            <xsl:value-of select="concat(autor/nombre, ' ', autor/apellido)" />
            <xsl:text>,</xsl:text>
            <xsl:value-of select="editorial" />
            <xsl:text>,</xsl:text>
            <!-- Solo el año, no la fecha entera: -->
            <xsl:value-of select="substring(fecha_publicacion,1,4)" />
            <xsl:text>,</xsl:text>
            <!-- Precio -->
             <xsl:value-of select="precio"></xsl:value-of>
            <xsl:text>,</xsl:text>
            <!-- Géneros separados por ; -->
             <xsl:for-each select="generos/genero">
                <xsl:value-of select="." />
                <xsl:if test="position() != last()">
                    <xsl:text>;</xsl:text>
                </xsl:if>
            </xsl:for-each>

            <!-- Disponibilidad -->
             <xsl:text>,</xsl:text>
             <xsl:choose>
                <xsl:when test="disponible = 'true'">
                    <xsl:text>Sí</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>No</xsl:text>
                </xsl:otherwise>
             </xsl:choose>

            <xsl:text>&#xa;</xsl:text>
            </xsl:if>
        </xsl:for-each>

    </xsl:template>
</xsl:stylesheet>