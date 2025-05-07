/*  qr.js – QR code SVG generator + badge  */

document.addEventListener('DOMContentLoaded', function() {
  // Get correct elements by their IDs from HTML
  const input = document.getElementById("qrContent");
  const make = document.getElementById("genBtn");
  const dl = document.getElementById("dlBtn");
  const prev = document.getElementById("qrPreview");

  // Load QR code library dynamically
  const script = document.createElement('script');
  script.src = "https://cdn.jsdelivr.net/npm/qrcode-svg@1.1.0/lib/qrcode.min.js";
  document.head.appendChild(script);
  
  script.onload = function() {
    // Initialize the generator once the library is loaded
    if (make) {
      make.addEventListener("click", generateQR);
    }
  };

  function decorate(svg) {
    /* Add clickable badge */
    const badge = `
      <a xlink:href="https://scanlytic.co?ref=qrgen"
         target="_blank" rel="noopener">
        <text x="50%" y="98%" font-size="6"
              text-anchor="middle" fill="#7c3aed"
              font-family="Inter,Arial,sans-serif">
          Powered by Scanlytic
        </text>
      </a>`;
    return svg.replace("</svg>", `${badge}</svg>`);
  }

  function generateQR() {
    const url = input.value.trim();
    if (!url) { 
      alert("Please enter a URL or text first"); 
      return; 
    }

    /* Generate SVG */
    if (typeof QRCode !== 'undefined') {
      const qr = new QRCode({
        content: url,
        padding: 4,
        color: "#000000",
        background: "#ffffff",
        ecl: "M"
      }).svg();

      const fullSVG = decorate(qr);
      prev.innerHTML = fullSVG;            // Show preview
      dl.href = URL.createObjectURL(new Blob([fullSVG], {type:"image/svg+xml"}));
      dl.classList.remove("pointer-events-none","opacity-50");
    } else {
      prev.innerHTML = '<div class="alert alert-error">Error loading QR library. Please try refreshing the page.</div>';
    }
  }
});