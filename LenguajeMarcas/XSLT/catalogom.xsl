<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"/>
  <xsl:template match="/">
    {
    "catalogo":{
    "categoria":{
    <xsl:for-each select="catalogo/categoria">
      <xsl:for-each select="./producto">
      <xsl:choose>
        <xsl:when test="position() = last()">
            "Producto":{
            "Nombre": "<xsl:value-of select="nombre"/>",
            "Marca": "<xsl:value-of select="marca"/>",
            "Precio": "<xsl:value-of select="precio"/>",
            "Stock": "<xsl:value-of select="stock"/>",
            "Especificaciones":{
            
            <xsl:choose>
              <xsl:when test="../@id='electronica'">
                <xsl:if test="especificaciones/pantalla">
                  <xsl:choose>
                    <xsl:when test="position() = last()">
                      "Pantalla": "<xsl:value-of select="especificaciones/pantalla"/>"
                    </xsl:when>
                    <xsl:otherwise>
                      "Pantalla": "<xsl:value-of select="especificaciones/pantalla"/>",
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:if>
                <xsl:if test="especificaciones/ram">
                  <xsl:choose>
                    <xsl:when test="position() = last()">
                      "Ram": "<xsl:value-of select="especificaciones/ram"/>"
                    </xsl:when>
                    <xsl:otherwise>
                      "Ram": "<xsl:value-of select="especificaciones/ram"/>",
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:if>
                <xsl:if test="especificaciones/almacenamiento">
                  <xsl:choose>
                    <xsl:when test="position() = last()">
                      "Almacenamiento": "<xsl:value-of select="especificaciones/almacenamiento"/>"
                    </xsl:when>
                    <xsl:otherwise>
                      "Almacenamiento": "<xsl:value-of select="especificaciones/almacenamiento"/>",
                    </xsl:otherwise>
                  </xsl:choose>                  
                </xsl:if>   
                <xsl:if test="especificaciones/tipo">
                  "Tipo": <xsl:value-of select="especificaciones/tipo"/>,
                </xsl:if>
                <xsl:if test="especificaciones/autonomia">
                  "Autonomia": "<xsl:value-of select="especificaciones/autonomia"/>"
                </xsl:if>
              </xsl:when>
              <xsl:when test="../@id">
                "Potencia": "<xsl:value-of select="especificaciones/potencia"/>",
                "Autonomia": "<xsl:value-of select="especificaciones/autonomia"/>"
              </xsl:when>
            </xsl:choose>
            },
            <xsl:if test="./etiquetas">
              "Etiquetas":[
              <xsl:for-each select="etiquetas/etiqueta">
                <xsl:choose>
                  <xsl:when test="position() = last()">
                    "Etiqueta": "<xsl:value-of select="."/>"
                  </xsl:when>
                  <xsl:otherwise>
                    "Etiqueta": "<xsl:value-of select="."/>",
                  </xsl:otherwise>
                </xsl:choose>
                
              </xsl:for-each>
              ]
            </xsl:if>
          
        </xsl:when>
        <xsl:otherwise>
          "Producto":{  
          
            
            "Nombre": "<xsl:value-of select="nombre"/>",
            "Marca": "<xsl:value-of select="marca"/>",
            "Precio": "<xsl:value-of select="precio"/>",
            "Stock": "<xsl:value-of select="stock"/>",
            "Especificaciones":{
            
            <xsl:choose>
              <xsl:when test="../@id='electronica'">
                <xsl:if test="especificaciones/pantalla">
                  "Pantalla": "<xsl:value-of select="especificaciones/pantalla"/>",
                </xsl:if>
                <xsl:if test="especificaciones/ram">
                  "Ram": "<xsl:value-of select="especificaciones/ram"/>"
                </xsl:if>
                <xsl:if test="especificaciones/almacenamiento">
                  "Almacenamiento": "<xsl:value-of select="especificaciones/almacenamiento"/>",
                </xsl:if>   
                <xsl:if test="especificaciones/tipo">
                  "Tipo": <xsl:value-of select="especificaciones/tipo"/>,
                </xsl:if>
                <xsl:if test="especificaciones/autonomia">
                  "Autonomia": "<xsl:value-of select="especificaciones/autonomia"/>"
                </xsl:if>
              </xsl:when>
              <xsl:when test="../@id='hogar'">
                "Potencia": "<xsl:value-of select="especificaciones/potencia"/>"
                "Autonomia": "<xsl:value-of select="especificaciones/autonomia"/>"
              </xsl:when>
            </xsl:choose>
            },
            <xsl:if test="./etiquetas">
              "Etiquetas":{
              <xsl:for-each select="etiquetas/etiqueta">
                <xsl:choose>
                  <xsl:when test="last()">
                    "Etiqueta": "<xsl:value-of select="."/>"
                  </xsl:when>
                  <xsl:otherwise>
                    "Etiqueta": "<xsl:value-of select="."/>",
                  </xsl:otherwise>
                </xsl:choose>
                
              </xsl:for-each>
              }
            </xsl:if>
          ,
        </xsl:otherwise>
      </xsl:choose>
      </xsl:for-each>}
    </xsl:for-each>
    }
    }
    }
    }
  </xsl:template>
</xsl:stylesheet>             