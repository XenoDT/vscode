<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
  
  <xsl:output method="html" indent="yes"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Facftura</title>
        <style>
          body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f9; }
          h2 { color: #333; text-align: center; }
          table { width: 100%; border-collapse: collapse; background: white; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
          th, td { padding: 12px; border: 1px solid #ddd; text-align: left; }
          th { background-color: #4CAF50; color: white; }
          tr:nth-child(even) { background-color: #f2f2f2; }
          .badge { padding: 4px 8px; border-radius: 4px; font-size: 0.8em; font-weight: bold; }
          .pegi { background: #ffcc00; color: black; }
          .lang { background: #2196F3; color: white; }
        </style>
      </head>
      <body>
        <header>
          <h2>Factura</h2>
          <ul><h3>Cliente</h3>
            <li>Nombre: <xsl:value-of select="factura/cliente/nombre"/></li>
            <li>NIF: <xsl:value-of select="factura/cliente/nif"/></li>
            <li>Direccion: <xsl:value-of select="factura/cliente/direccion"/></li>
          </ul>
        </header>
        <main>
          <table>
            <tr>
              <th>Producto</th>
              <th>Cantidad</th>
              <th>Precio_unitario</th>
            </tr>
            <xsl:for-each select="factura/lineas/linea">              
              <tr>
                <td><xsl:value-of select="producto"/></td>
                <td><xsl:value-of select="cantidad"/></td>
                <td><xsl:value-of select="precio_unitario"/></td>
              </tr>
              
            </xsl:for-each>
          </table>
        </main>
        <footer>
          <p>IVA: <xsl:value-of select="factura/iva"/></p>  
        </footer>
      </body>
    </html> 
  </xsl:template>
  
</xsl:stylesheet>