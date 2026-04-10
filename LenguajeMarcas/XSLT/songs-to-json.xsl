<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" indent="yes"/>

  <xsl:template match="/">
      {
        "songs": [
          <xsl:for-each select="songs/song">
            <xsl:sort select="year" order="descending"></xsl:sort>
            "song":[
              "title":"<xsl:value-of select="title"/>",
              "artist": "<xsl:value-of select="artist"/>",
              "year": "<xsl:value-of select="year"/>"
            ]<xsl:if test="position() != last()">,</xsl:if>
          </xsl:for-each>
        ]
      }
    
    
  </xsl:template>
</xsl:stylesheet>