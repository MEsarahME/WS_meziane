const LANGS = ['fr', 'en', 'ar'];
function getLang() {
  const urlLang = new URLSearchParams(window.location.search).get('lang');
  if (urlLang && LANGS.includes(urlLang)) return urlLang;
  const stored = localStorage.getItem('lang');
  if (stored && LANGS.includes(stored)) return stored;
  const browserLang = (navigator.languages ? navigator.languages[0] : navigator.language).slice(0,2);
  if (LANGS.includes(browserLang)) return browserLang;
  return 'fr';
}
function setLang(lg) {
  if (!LANGS.includes(lg)) lg = 'fr';
  localStorage.setItem('lang', lg);
  const params = new URLSearchParams(window.location.search);
  params.set('lang', lg);
  window.location.search = params.toString();
}
function loadPortfolio(lang) {
  const xmlReq = new XMLHttpRequest();
  xmlReq.open('GET', 'portfolio.xml', true);
  xmlReq.onreadystatechange = function() {
    if (xmlReq.readyState === 4 && xmlReq.status === 200) {
      const xsltReq = new XMLHttpRequest();
      xsltReq.open('GET', 'portfolio.xsl', true);
      xsltReq.onreadystatechange = function() {
        if (xsltReq.readyState === 4 && xsltReq.status === 200) {
          const parser = new DOMParser();
          const xml = parser.parseFromString(xmlReq.responseText, 'text/xml');
          const xsl = parser.parseFromString(xsltReq.responseText, 'text/xml');
          const processor = new XSLTProcessor();
          processor.setParameter(null, "lang", lang);
          processor.importStylesheet(xsl);
          const result = processor.transformToFragment(xml, document);
          document.getElementById('content').innerHTML = "";
          document.getElementById('content').appendChild(result);
        }
      };
      xsltReq.send();
    }
  };
  xmlReq.send();
}
window.onload = function() {
  const lang = getLang();
  loadPortfolio(lang);
  // Dark mode preference
  if (localStorage.getItem('darkMode') === 'true' ||
      (localStorage.getItem('darkMode') === null && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
    document.body.classList.add('dark-mode');
    setDarkIcon(true);
  } else {
    setDarkIcon(false);
  }
}

function toggleDarkMode() {
  const isDark = document.body.classList.toggle('dark-mode');
  localStorage.setItem('darkMode', isDark);
  setDarkIcon(isDark);
}

function setDarkIcon(isDark) {
  const btn = document.getElementById('darkmode-toggle');
  if (btn) btn.textContent = isDark ? '☀️' : '🌙';
}
