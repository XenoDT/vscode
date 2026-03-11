<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>PlayList</title>
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
                <h2>OGs</h2>
                <table>
                    <tr>
                        <th>Titulo</th>
                        <th>Artista</th>
                        <th>Año</th>
                    </tr>
                    <xsl:for-each select="songs/song">
                    <xsl:sort select="year" data-type="number"/>
                                            
                    <tr>
                        <td><xsl:value-of select="title"/></td>
                        <td><xsl:value-of select="artist"/></td>
                        <td><xsl:value-of select="year"/></td>
                    </tr>
                    </xsl:for-each>
                </table>
                <h2>Suma de años: <xsl:value-of select="sum(songs//year)"/></h2>
            </body>
        </html>    
        
    </xsl:template>
</xsl:stylesheet>             