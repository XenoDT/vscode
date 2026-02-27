<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" encoding="UTF-8" />
    <xsl:template match="/">
        <html lang="en">
            <head>
                <title>Librería</title>
                <link rel="stylesheet" href="/ExamenCSS/portfolio.css"/>
            </head>
            <body>
                <h2>
                    <xsl:value-of select="book/title" />
                </h2>
                <h3>
                    <xsl:value-of select="book/author" />
                </h3>
                <p>
                    <xsl:value-of select="book/year" />
                </p>
                <p>
                    <xsl:value-of select="book/pages" />
                </p>
                <p>
                    <xsl:value-of select="book/description" />
                </p>
                <p>Clic <a href="{book/links/link}">aquí</a></p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>