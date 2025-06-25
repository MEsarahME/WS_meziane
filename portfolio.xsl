<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html"/>

  <xsl:param name="lang" select="'fr'"/>

  <xsl:template match="/portfolio">
    <main vocab="https://schema.org/" typeof="Person" about="#me">
      <header typeof="Person" about="#me">
        <div style="display: flex; flex-direction: column; align-items: center; gap: 1.2em;">
          <img src="css/profile.png" alt="Photo de profil Sarah Meziane" style="width: 120px; height: 120px; object-fit: cover; border-radius: 50%; box-shadow: 0 2px 12px #f8a5c2; border: 4px solid #fff; margin-bottom: 0.5em;" property="image"/>
          <h1 property="name">
            <xsl:choose>
              <xsl:when test="meta/titre/texte[@lang=$lang]/@lang='ar'">
                <span dir="rtl" style="text-align:right;display:block">
                  <xsl:value-of select="meta/titre/texte[@lang=$lang]"/>
                </span>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="meta/titre/texte[@lang=$lang]"/>
              </xsl:otherwise>
            </xsl:choose>
          </h1>
          <h3 property="jobTitle">
            <xsl:choose>
              <xsl:when test="meta/jobTitle/texte[@lang=$lang]/@lang='ar'">
                <span dir="rtl" style="text-align:right;display:block">
                  <xsl:value-of select="meta/jobTitle/texte[@lang=$lang]"/>
                </span>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="meta/jobTitle/texte[@lang=$lang]"/>
              </xsl:otherwise>
            </xsl:choose>
          </h3>
        </div>
        <p property="description">
          <xsl:choose>
            <xsl:when test="presentation/texte[@lang=$lang]/@lang='ar'">
              <span dir="rtl" style="text-align:right;display:block">
                <xsl:value-of select="presentation/texte[@lang=$lang]"/>
              </span>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="presentation/texte[@lang=$lang]"/>
            </xsl:otherwise>
          </xsl:choose>
        </p>
        <div>
          <b>Email :</b> <span property="email"><xsl:value-of select="meta/auteur/email"/></span> | 
          <b>Tel :</b> <span property="telephone"><xsl:value-of select="meta/auteur/tel"/></span> |
          <b>Ville :</b> <span property="addressLocality"><xsl:value-of select="meta/auteur/ville"/></span>
        </div>
        <div>
          <b>LinkedIn :</b>
          <xsl:variable name="linkedin" select="meta/auteur/linkedin"/>
          <a property="sameAs">
            <xsl:attribute name="href">
              <xsl:choose>
                <xsl:when test="starts-with($linkedin, 'http')">
                  <xsl:value-of select="$linkedin"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text>https://</xsl:text><xsl:value-of select="$linkedin"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <xsl:value-of select="$linkedin"/>
          </a>
        </div>
        <div>
          <b>Permis :</b> <span property="hasCredential"><xsl:value-of select="meta/auteur/permis"/></span>
        </div>
      </header>

      <!-- Beaucoup de fleurs roses animées sur les côtés, sans gêner le texte -->
      <div style="position: fixed; left: 0; top: 0; width: 80px; height: 100vh; z-index: 0; pointer-events: none;">
        <svg width="80" height="100vh" style="position: absolute; left: 0; top: 0; width: 80px; height: 100vh;" xmlns="http://www.w3.org/2000/svg">
          <g>
            <g>
              <animateTransform attributeName="transform" type="translate" values="0,0; 0,30; 0,0" dur="4s" repeatCount="indefinite"/>
              <circle cx="40" cy="60" r="15" fill="#f8a5c2"/>
              <circle cx="40" cy="45" r="8" fill="#f78fb3"/>
              <circle cx="40" cy="75" r="8" fill="#f78fb3"/>
              <circle cx="25" cy="60" r="8" fill="#f78fb3"/>
              <circle cx="55" cy="60" r="8" fill="#f78fb3"/>
              <circle cx="40" cy="60" r="6" fill="#f6e58d"/>
            </g>
            <g>
              <animateTransform attributeName="transform" type="translate" values="0,0; 0,50; 0,0" dur="6s" repeatCount="indefinite"/>
              <circle cx="40" cy="180" r="13" fill="#f8a5c2"/>
              <circle cx="40" cy="168" r="7" fill="#f78fb3"/>
              <circle cx="40" cy="192" r="7" fill="#f78fb3"/>
              <circle cx="27" cy="180" r="7" fill="#f78fb3"/>
              <circle cx="53" cy="180" r="7" fill="#f78fb3"/>
              <circle cx="40" cy="180" r="5" fill="#f6e58d"/>
            </g>
            <g>
              <animateTransform attributeName="transform" type="translate" values="0,0; 0,80; 0,0" dur="8s" repeatCount="indefinite"/>
              <circle cx="40" cy="320" r="10" fill="#f8a5c2"/>
              <circle cx="40" cy="311" r="5" fill="#f78fb3"/>
              <circle cx="40" cy="329" r="5" fill="#f78fb3"/>
              <circle cx="31" cy="320" r="5" fill="#f78fb3"/>
              <circle cx="49" cy="320" r="5" fill="#f78fb3"/>
              <circle cx="40" cy="320" r="3.5" fill="#f6e58d"/>
            </g>
            <!-- Ajoutez d'autres groupes pour plus de fleurs -->
          </g>
        </svg>
      </div>
      <div style="position: fixed; right: 0; top: 0; width: 80px; height: 100vh; z-index: 0; pointer-events: none;">
        <svg width="80" height="100vh" style="position: absolute; right: 0; top: 0; width: 80px; height: 100vh;" xmlns="http://www.w3.org/2000/svg">
          <g>
            <g>
              <animateTransform attributeName="transform" type="translate" values="0,0; 0,-30; 0,0" dur="4.5s" repeatCount="indefinite"/>
              <circle cx="40" cy="120" r="15" fill="#f8a5c2"/>
              <circle cx="40" cy="105" r="8" fill="#f78fb3"/>
              <circle cx="40" cy="135" r="8" fill="#f78fb3"/>
              <circle cx="25" cy="120" r="8" fill="#f78fb3"/>
              <circle cx="55" cy="120" r="8" fill="#f78fb3"/>
              <circle cx="40" cy="120" r="6" fill="#f6e58d"/>
            </g>
            <g>
              <animateTransform attributeName="transform" type="translate" values="0,0; 0,-50; 0,0" dur="6.5s" repeatCount="indefinite"/>
              <circle cx="40" cy="260" r="13" fill="#f8a5c2"/>
              <circle cx="40" cy="248" r="7" fill="#f78fb3"/>
              <circle cx="40" cy="272" r="7" fill="#f78fb3"/>
              <circle cx="27" cy="260" r="7" fill="#f78fb3"/>
              <circle cx="53" cy="260" r="7" fill="#f78fb3"/>
              <circle cx="40" cy="260" r="5" fill="#f6e58d"/>
            </g>
            <g>
              <animateTransform attributeName="transform" type="translate" values="0,0; 0,-80; 0,0" dur="8.5s" repeatCount="indefinite"/>
              <circle cx="40" cy="400" r="10" fill="#f8a5c2"/>
              <circle cx="40" cy="391" r="5" fill="#f78fb3"/>
              <circle cx="40" cy="409" r="5" fill="#f78fb3"/>
              <circle cx="31" cy="400" r="5" fill="#f78fb3"/>
              <circle cx="49" cy="400" r="5" fill="#f78fb3"/>
              <circle cx="40" cy="400" r="3.5" fill="#f6e58d"/>
            </g>
            <!-- Ajoutez d'autres groupes pour plus de fleurs -->
          </g>
        </svg>
      </div>

      <xsl:apply-templates select="formation"/>
      <xsl:apply-templates select="competences"/>
      <xsl:apply-templates select="certificats"/>
      <xsl:apply-templates select="experience"/>
      <xsl:apply-templates select="projets"/>
      <xsl:apply-templates select="hobbies"/>
      <xsl:apply-templates select="derniermot"/>

      <section typeof="ImageObject" about="#svg-illustration" style="margin-top:2em;text-align:center">
        <xsl:apply-templates select="svg"/>
      </section>
      <section typeof="ImageObject" about="#svg-animated-hearts" style="margin-top:2em;text-align:center">
        <div>
          <svg width="100%" height="320" viewBox="0 0 800 320" fill="none" xmlns="http://www.w3.org/2000/svg">
            <style>
              .heart {
                opacity: 0.82;
                animation: float 7s infinite alternate ease-in-out;
                transform-box: fill-box;
                transform-origin: center;
              }
              .h1 { animation-delay: 0s;}
              .h2 { animation-delay: 1.5s;}
              .h3 { animation-delay: 2.7s;}
              .h4 { animation-delay: 0.9s;}
              .h5 { animation-delay: 3.3s;}
              .h6 { animation-delay: 2.1s;}
              .h7 { animation-delay: 3.9s;}
              .h8 { animation-delay: 2.8s;}
              @keyframes float {
                0%   { transform: translateY(0) scale(1);}
                50%  { transform: translateY(-55px) scale(1.05);}
                100% { transform: translateY(-100px) scale(1.08);}
              }
            </style>
            <g class="heart h1">
              <path d="M60 210 C 60 188, 100 188, 100 210 Q 100 240, 60 260 Q 20 240, 20 210 C 20 188, 60 188, 60 210 Z" fill="#e74c3c"/>
            </g>
            <g class="heart h2">
              <path d="M170 270 C 170 248, 210 248, 210 270 Q 210 300, 170 320 Q 130 300, 130 270 C 130 248, 170 248, 170 270 Z" fill="#fd79a8"/>
            </g>
            <g class="heart h3">
              <path d="M310 180 C 310 160, 340 160, 340 180 Q 340 205, 310 220 Q 280 205, 280 180 C 280 160, 310 160, 310 180 Z" fill="#c0392b"/>
            </g>
            <g class="heart h4">
              <path d="M470 220 C 470 203, 500 203, 500 220 Q 500 247, 470 260 Q 440 247, 440 220 C 440 203, 470 203, 470 220 Z" fill="#f8a5c2"/>
            </g>
            <g class="heart h5">
              <path d="M600 175 C 600 162, 620 162, 620 175 Q 620 192, 600 202 Q 580 192, 580 175 C 580 162, 600 162, 600 175 Z" fill="#e74c3c"/>
            </g>
            <g class="heart h6">
              <path d="M700 250 C 700 237, 720 237, 720 250 Q 720 265, 700 275 Q 680 265, 680 250 C 680 237, 700 237, 700 250 Z" fill="#ff99cc"/>
            </g>
            <g class="heart h7">
              <path d="M770 200 C 770 191, 782 191, 782 200 Q 782 212, 770 218 Q 758 212, 758 200 C 758 191, 770 191, 770 200 Z" fill="#fd79a8"/>
            </g>
            <g class="heart h8">
              <path d="M380 120 C 380 110, 395 110, 395 120 Q 395 133, 380 140 Q 365 133, 365 120 C 365 110, 380 110, 380 120 Z" fill="#e74c3c"/>
            </g>
          </svg>
        </div>
      </section>
    </main>
  </xsl:template>

  <xsl:template match="formation|competences|certificats|experience|projets|hobbies">
    <section typeof="CreativeWork" about="#me">
      <h2 property="name">
        <xsl:choose>
          <xsl:when test="titre/texte[@lang=$lang]/@lang='ar'">
            <span dir="rtl" style="text-align:right;display:block">
              <xsl:value-of select="titre/texte[@lang=$lang]"/>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="titre/texte[@lang=$lang]"/>
          </xsl:otherwise>
        </xsl:choose>
      </h2>
      <xsl:choose>
        <xsl:when test="$lang='ar'">
          <ul dir="rtl" typeof="ItemList">
            <xsl:for-each select="item">
              <li property="about" dir="rtl" typeof="ListItem">
                <span property="description">
                  <xsl:choose>
                    <xsl:when test="texte[@lang=$lang]/@lang='ar'">
                      <span dir="rtl" style="text-align:right;display:block">
                        <xsl:value-of select="texte[@lang=$lang]"/>
                      </span>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="texte[@lang=$lang]"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </span>
                <xsl:if test="lien">
                  <br/>
                  <xsl:choose>
                    <xsl:when test="name(..)='projets'">
                      <a property="url" href="{lien}" dir="rtl" style="text-align:right;display:inline-block">رابط المشروع</a>
                    </xsl:when>
                    <xsl:otherwise>
                      <a property="url" href="{lien}" dir="rtl" style="text-align:right;display:inline-block">شاهد الشهادة</a>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:if>
              </li>
            </xsl:for-each>
          </ul>
        </xsl:when>
        <xsl:otherwise>
          <ul typeof="ItemList">
            <xsl:for-each select="item">
              <li property="about" typeof="ListItem">
                <span property="description">
                  <xsl:choose>
                    <xsl:when test="texte[@lang=$lang]/@lang='ar'">
                      <span dir="rtl" style="text-align:right;display:block">
                        <xsl:value-of select="texte[@lang=$lang]"/>
                      </span>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="texte[@lang=$lang]"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </span>
                <xsl:if test="lien">
                  <br/>
                  <xsl:choose>
                    <xsl:when test="name(..)='projets'">
                      <a property="url" href="{lien}">
                        <xsl:choose>
                          <xsl:when test="$lang='en'">Project link</xsl:when>
                          <xsl:when test="$lang='fr'">Lien du projet</xsl:when>
                          <xsl:otherwise>Project link</xsl:otherwise>
                        </xsl:choose>
                      </a>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:choose>
                        <xsl:when test="$lang='en'">
                          <a property="url" href="{lien}">See certificate</a>
                        </xsl:when>
                        <xsl:otherwise>
                          <a property="url" href="{lien}">Voir le certificat</a>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:if>
              </li>
            </xsl:for-each>
          </ul>
        </xsl:otherwise>
      </xsl:choose>
    </section>
  </xsl:template>

  <xsl:template match="svg">
    <div>
      <img src="{file}" alt="Illustration portfolio" style="max-width:400px;width:100%;height:auto;"/>
      <p>
        <xsl:choose>
          <xsl:when test="description/texte[@lang=$lang]">
            <xsl:value-of select="description/texte[@lang=$lang]"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="description/texte[@lang='fr']"/>
          </xsl:otherwise>
        </xsl:choose>
      </p>
    </div>
  </xsl:template>

  <xsl:template match="derniermot">
    <section typeof="CreativeWork" about="#conclusion" style="margin-top:2em;">
      <h2 property="name">
        <xsl:choose>
          <xsl:when test="titre/texte[@lang=$lang]/@lang='ar'">
            <span dir="rtl" style="text-align:right;display:block">
              <xsl:value-of select="titre/texte[@lang=$lang]"/>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="titre/texte[@lang=$lang]"/>
          </xsl:otherwise>
        </xsl:choose>
      </h2>
      <p property="description">
        <xsl:choose>
          <xsl:when test="texte[@lang=$lang]/@lang='ar'">
            <span dir="rtl" style="text-align:right;display:block">
              <xsl:value-of select="texte[@lang=$lang]"/>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="texte[@lang=$lang]"/>
          </xsl:otherwise>
        </xsl:choose>
      </p>
    </section>
  </xsl:template>
</xsl:stylesheet>
