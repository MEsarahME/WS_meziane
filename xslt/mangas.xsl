<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/mangas">
    <html>
      <head>
        <title>Liste de Mangas</title>
        <style>
          body { font-family: Arial, sans-serif; background: #f8f8f8; }
          h1 { color: #333; }
          .manga-list { display: flex; flex-wrap: wrap; gap: 24px; }
          .manga { background: #fff; border-radius: 8px; box-shadow: 0 2px 8px #0001; padding: 16px; width: 320px; }
          .manga img { max-width: 100px; float: right; margin-left: 12px; border-radius: 4px; }
          .manga h2 { margin-top: 0; color: #0074d9; }
          .meta { font-size: 0.95em; color: #666; margin-bottom: 8px; }
          .resume { clear: both; margin-top: 10px; }
        </style>
      </head>
      <body>
        <h1>Liste de Mangas</h1>
        <div class="manga-list">
          <xsl:apply-templates select="manga"/>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="manga">
    <div class="manga">
      <img>
        <xsl:attribute name="src">
          <xsl:value-of select="image/@src"/>
        </xsl:attribute>
        <xsl:attribute name="alt">
          <xsl:value-of select="titre"/>
        </xsl:attribute>
      </img>
      <h2><xsl:value-of select="titre"/></h2>
      <div class="meta">
        <b>Genre:</b> <xsl:value-of select="@genre"/> | 
        <b>Statut:</b> <xsl:value-of select="@statut"/> | 
        <b>Tome:</b> <xsl:value-of select="tome/@numero"/> (<xsl:value-of select="tome/@disponible"/>)<br/>
        <b>Auteur:</b> <xsl:value-of select="auteur"/> | 
        <b>Éditeur:</b> <xsl:value-of select="editeur"/> | 
        <b>Année:</b> <xsl:value-of select="annee"/>
      </div>
      <div class="resume">
        <xsl:value-of select="resume"/>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>
