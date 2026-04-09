<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <html lang="es">
            <head>
                <meta charset="UTF-8"/>
                <title>Factura</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                    }
                    .factura {
                        width: 80%;
                        margin: 0 auto;
                        border: 1px solid #ccc;
                        padding: 20px;
                    }
                    .cabecera {
                        border-bottom: 2px solid #333;
                        margin-bottom: 20px;
                    }
                    .datos-cliente {
                        background-color: #f5f5f5;
                        padding: 10px;
                        margin-bottom: 20px;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-bottom: 20px;
                    }
                    th, td {
                        border: 1px solid #ddd;
                        padding: 10px;
                        text-align: left;
                    }
                    th {
                        background-color: #4CAF50;
                        color: white;
                    }
                    .fila-par {
                        background-color: #f9f9f9;
                    }
                    .fila-impar {
                        background-color: #ffffff;
                    }
                    .totales {
                        text-align: right;
                        margin-top: 20px;
                        padding-top: 10px;
                        border-top: 2px solid #333;
                    }
                    .totales p {
                        margin: 5px 0;
                    }
                </style>
            </head>
            <body>
                <div class="factura">
                    <div class="cabecera">
                        <h1>FACTURA</h1>
                        <p><strong>Numero:</strong> <xsl:value-of select="factura/@numero"/></p>
                        <p><strong>Fecha:</strong> <xsl:value-of select="factura/@fecha"/></p>
                    </div>
                    
                    <div class="datos-cliente">
                        <h3>Datos del Cliente</h3>
                        <p><strong>Nombre:</strong> <xsl:value-of select="factura/cliente/nombre"/></p>
                        <p><strong>NIF:</strong> <xsl:value-of select="factura/cliente/nif"/></p>
                        <p><strong>Direccion:</strong> <xsl:value-of select="factura/cliente/direccion"/></p>
                    </div>
                    
                    <h3>Lineas de Factura</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Producto</th>
                                <th>Cantidad</th>
                                <th>Precio Unitario</th>
                                <th>Total Linea</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="factura/lineas/linea">
                                <tr>
                                    <xsl:if test="position() mod 2 = 0">
                                        <td class="fila-par"><xsl:value-of select="producto"/></td>
                                        <td class="fila-par"><xsl:value-of select="cantidad"/></td>
                                        <td class="fila-par"><xsl:value-of select="format-number(precio_unitario, '0.00')"/> €</td>
                                        <td class="fila-par"><xsl:value-of select="format-number(cantidad * precio_unitario, '0.00')"/> €</td>
                                    </xsl:if>
                                    <xsl:if test="position() mod 2 != 0">
                                        <td class="fila-impar"><xsl:value-of select="producto"/></td>
                                        <td class="fila-impar"><xsl:value-of select="cantidad"/></td>
                                        <td class="fila-impar"><xsl:value-of select="format-number(precio_unitario, '0.00')"/> €</td>
                                        <td class="fila-impar"><xsl:value-of select="format-number(cantidad * precio_unitario, '0.00')"/> €</td>
                                    </xsl:if>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                    
                    <div class="totales">
                        <p><strong>Subtotal:</strong> 
                            <xsl:value-of select="format-number(sum(factura/lineas/linea/cantidad * factura/lineas/linea/precio_unitario), '0.00')"/> €
                        </p>
                        <p><strong>IVA (<xsl:value-of select="factura/iva"/>%):</strong> 
                            <xsl:value-of select="format-number(sum(factura/lineas/linea/cantidad * factura/lineas/linea/precio_unitario) * (factura/iva div 100), '0.00')"/> €
                        </p>
                        <p><strong>TOTAL:</strong> 
                            <xsl:value-of select="format-number(sum(factura/lineas/linea/cantidad * factura/lineas/linea/precio_unitario) + (sum(factura/lineas/linea/cantidad * factura/lineas/linea/precio_unitario) * (factura/iva div 100)), '0.00')"/> €
                        </p>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>