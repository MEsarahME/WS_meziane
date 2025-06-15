<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Profil Étudiant</title>
        <style>
          body { font-family: Arial, sans-serif; background: #f8f8f8; }
          .profil { background: #fff; border-radius: 10px; box-shadow: 0 2px 8px #0001; padding: 24px; max-width: 700px; margin: 32px auto; }
          .photo { float: right; margin-left: 24px; border-radius: 50%; width: 120px; height: 120px; object-fit: cover; border: 2px solid #0074d9; }
          h1, h2 { color: #0074d9; }
          .meta, .contact, .reseaux, .langues, .experiences, .projets, .interets { margin-bottom: 18px; }
          .meta span { display: inline-block; margin-right: 18px; }
          ul { margin: 0 0 0 20px; }
          .section-title { margin-top: 32px; }
        </style>
      </head>
      <body>
        <div class="profil">
          <img class="photo">
            <xsl:attribute name="src"><xsl:value-of select="etudiant/photo"/></xsl:attribute>
            <xsl:attribute name="alt">Photo de <xsl:value-of select="etudiant/prenom"/></xsl:attribute>
          </img>
          <h1><xsl:value-of select="etudiant/prenom"/> <xsl:value-of select="etudiant/nom"/></h1>
          <div class="meta">
            <span><b>Âge :</b> <xsl:value-of select="etudiant/age"/></span>
            <span><b>Année :</b> <xsl:value-of select="etudiant/annee"/></span>
            <span><b>Formation :</b> <xsl:value-of select="etudiant/formation"/></span>
            <span><b>Université :</b> <xsl:value-of select="etudiant/universite"/></span>
          </div>
          <div class="contact">
            <span><b>Email :</b> <xsl:value-of select="etudiant/email"/></span><br/>
            <span><b>Téléphone :</b> <xsl:value-of select="etudiant/telephone"/></span>
          </div>
          <div class="reseaux">
            <b>Réseaux sociaux :</b>
            <ul>
              <xsl:for-each select="etudiant/reseaux/reseau">
                <li>
                  <xsl:value-of select="@type"/> :
                  <a>
                    <xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute>
                    <xsl:value-of select="."/>
                  </a>
                </li>
              </xsl:for-each>
            </ul>
          </div>
          <div class="langues">
            <b>Langues :</b>
            <ul>
              <xsl:for-each select="etudiant/langues/langue">
                <li><xsl:value-of select="."/> (<xsl:value-of select="@niveau"/>)</li>
              </xsl:for-each>
            </ul>
          </div>
          <div class="section-title"><h2>Compétences</h2></div>
          <ul>
            <xsl:for-each select="etudiant/competences/competence">
              <li><xsl:value-of select="."/></li>
            </xsl:for-each>
          </ul>
          <div class="section-title"><h2>Expériences</h2></div>
          <div class="experiences">
            <xsl:for-each select="etudiant/experiences/experience">
              <div style="margin-bottom:10px;">
                <b><xsl:value-of select="poste"/></b> chez <i><xsl:value-of select="entreprise"/></i> (<xsl:value-of select="annee"/>, <xsl:value-of select="duree"/>)<br/>
                <span><xsl:value-of select="description"/></span>
              </div>
            </xsl:for-each>
          </div>
          <div class="section-title"><h2>Projets</h2></div>
          <div class="projets">
            <xsl:for-each select="etudiant/projets/projet">
              <div style="margin-bottom:10px;">
                <b><xsl:value-of select="titre"/></b> : <xsl:value-of select="description"/>
                <xsl:if test="lien">
                  [<a>
                    <xsl:attribute name="href"><xsl:value-of select="lien"/></xsl:attribute>
                    Voir
                  </a>]
                </xsl:if>
              </div>
            </xsl:for-each>
          </div>
          <div class="section-title"><h2>Centres d'intérêt</h2></div>
          <div class="interets">
            <ul>
              <xsl:for-each select="etudiant/centres_interet/interet">
                <li><xsl:value-of select="."/></li>
              </xsl:for-each>
            </ul>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
