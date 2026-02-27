<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Biblioteca de Juegos</title>
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
                <h2>Lista de Videojuegos</h2>
                <table>
                    <tr>
                        <th>Nombre</th>
                        <th>Año/Versión</th>
                        <th>PEGI</th>
                        <th>Configuración / Modo</th>
                        <th>Idioma Activo</th>
                    </tr>
                    <xsl:for-each select="games/game">
                        <xsl:sort select="name" order="descending" data-type="number"/>
                        <tr>
                            <td>
                                <strong>
                                    <xsl:value-of select="name"/>
                                </strong>
                            </td>
                            <td>
                                <xsl:value-of select="date"/>
  (v.<xsl:value-of select="version"/>
)</td>

                            <td>
                                <span class="badge pegi">PEGI <xsl:value-of select="pegi"/>
                                </span>
                            </td>

                            <td>
                                <xsl:if test="gamemode">
                                    <em>Modo:</em>
                                    <xsl:choose>
                                        <xsl:when test="gamemode/mode/creative='true'"> Creativo</xsl:when>
                                        <xsl:when test="gamemode/mode/survival='true'"> Supervivencia</xsl:when>
                                        <xsl:otherwise> Otros</xsl:otherwise>
                                    </xsl:choose>
                                    <br/>
                                    <small>IP: <xsl:value-of select="gamemode/multiplayer/server/ip"/>
                                    </small>
                                </xsl:if>
                            
                                <xsl:if test="world">
                                    <em>Mundo:</em>
                                    <xsl:if test="world/type/big='true'"> Grande</xsl:if>
                                    <br/>
                                    <em>Dificultad:</em>
                                    <xsl:if test="world/dificulty/master='true'"> Maestro</xsl:if>
                                    <br/>
                                    <small>Jugador: <xsl:value-of select="player/name"/>
                                    </small>
                                    <small> Tipo: <xsl:value-of select="player/type"/>
                                    </small>
                                </xsl:if>

                                <xsl:if test="progress">
                                    <em>Granja: </em>
                                    <xsl:value-of select="farm/name"/>
                                    <em> Tipo: </em>
                                    <xsl:value-of select="farm/type"/>
                                    <em> Mascota: </em>
                                    <xsl:value-of select="farm/pet"/>
                                    <br/>
                                    <em>Año: <xsl:value-of select="progress/year"/>
                                    </em>

                                    <br/>
                                    <em>Estacion: </em>
                                    <xsl:value-of select="progress/season"/>
                                    <br/>
                                    <small>Community Center: <xsl:value-of select="progress/community_center"/>
                                    </small>
                                    <small> Joja Route: <xsl:value-of select="progress/joja_route"/>
                                    </small>
                                </xsl:if>
                            </td>

                            <td>
                                <xsl:for-each select="language/*">
                                    <xsl:if test=". = 'true'">
                                        <span class="badge lang">
                                            <xsl:value-of select="name()"/>
                                        </span>
                                    </xsl:if>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>