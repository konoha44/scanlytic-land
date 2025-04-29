/*  qr.js – мини-генератор SVG-QR + бейдж  */
import QRCode from "https://cdn.skypack.dev/qrcode-svg@1.1.0";

const input  = document.getElementById("qrInput");
const make   = document.getElementById("makeBtn");
const dl     = document.getElementById("dlBtn");
const prev   = document.getElementById("qrPreview");

function decorate(svg) {
  /* добавляем кликабельный бейдж */
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

make.addEventListener("click", () => {
  const url = input.value.trim();
  if (!url) { alert("Paste a URL first"); return; }

  /* генерируем SVG */
  const qr = new QRCode({
    content: url,
    padding: 4,
    color:   "#000000",
    background: "#ffffff",
    ecl: "M"
  }).svg();

  const fullSVG = decorate(qr);
  prev.innerHTML = fullSVG;            // показываем превью
  dl.href = URL.createObjectURL(new Blob([fullSVG], {type:"image/svg+xml"}));
  dl.classList.remove("pointer-events-none","opacity-50");
});