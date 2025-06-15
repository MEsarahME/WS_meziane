<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
  <xsl:template match="/">
    <html>
    <head><title>RSS Manga</title></head>
    <body>
      <h1><xsl:value-of select="rss/channel/title"/></h1>
      <xsl:for-each select="rss/channel/item">
        <div style="border:1px solid #ccc; margin:10px; padding:10px;">
          <h2><xsl:value-of select="title"/></h2>
          <p><xsl:value-of select="description"/></p>
          <p><a href="{link}">Lire plus</a></p>
          <p><small><xsl:value-of select="pubDate"/></small></p>
        </div>
      </xsl:for-each>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
