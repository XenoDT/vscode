<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" encoding="UTF-8"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Catálogo de Biblioteca</title>
        <style>
          .primero { background: linear-gradient(to right, #e0e0e0, #ffffff); }
          .ultimo-titulo { background-color: red; color: white; }
          table { border-collapse: collapse; width: 100%; }
          th, td { border: 1px solid black; padding: 8px; text-align: left; }
          tfoot { font-weight: bold; background-color: #f2f2f2; }
        </style>
      </head>
      <body>
        <h2>Lista de Libros</h2>
        <table>
          <thead>
            <tr>
              <th>Título</th>
              <th>ISBN</th>
              <th>Autor</th>
              <th>Precio</th>
              <th>Disponible</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="biblioteca/libro">
              <tr>
                <xsl:if test="position() = 1">
                  <xsl:attribute name="class">primero</xsl:attribute>
                </xsl:if>
                
                <td>
                  <xsl:if test="position() = last()">
                    <xsl:attribute name="class">ultimo-titulo</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="titulo"/>
                </td>
                <td><xsl:value-of select="@isbn"/></td>
                <td><xsl:value-of select="concat(autor/nombre, ' ', autor/apellido)"/></td>
                <td><xsl:value-of select="precio"/> €</td>
                <td>
                  <xsl:choose>
                    <xsl:when test="disponible = 'true'">Sí</xsl:when>
                    <xsl:otherwise>No</xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
          <tfoot>
            <tr>
              <td colspan="3">Totales</td>
              <td>Suma: <xsl:value-of select="sum(biblioteca/libro/precio)"/> €</td>
              <td>Media: <xsl:value-of select="format-number(sum(biblioteca/libro/precio) div count(biblioteca/libro), '#.00')"/> €</td>
            </tr>
          </tfoot>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>