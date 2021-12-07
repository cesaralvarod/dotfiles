class Content {
  constructor() {
    this.initMessageListeners(),
      (this.pdfFiles = null),
      (this.isPdfContentType = !1),
      (this.unknownLinksCounter = 1),
      (this.requestCounter = 0);
  }
  initMessageListeners() {
    chrome.runtime.onMessage.addListener((a, b, c) => {
      if ('getAllPdf' === a.type) return this.getAllPdfFiles(), c('resp'), !0;
    });
  }
  getAllPdfFiles() {
    return (
      (this.pdfFiles = document.querySelectorAll(
        'a[href$=".pdf"], embed[src$=".pdf"], object[data$=".pdf"], iframe[src$=".pdf"]'
      )),
      this.pdfFiles.length
        ? void this.getContentType()
        : void this.sendEmptyPdfResponse()
    );
  }
  getContentType() {
    for (let a = 0; a < this.pdfFiles.length; a++) {
      const b =
        this.pdfFiles[a].href || this.pdfFiles[a].src || this.pdfFiles[a].data;
      try {
        this.fetchHeaders(b, a);
      } catch (a) {}
    }
  }
  fetchHeaders(a, b) {
    fetch(a, { method: 'HEAD' })
      .then(
        c => (
          this.requestCounter++,
          c.headers.get('Content-Type') ||
          this.requestCounter !== this.pdfFiles.length
            ? 'application/pdf' === c.headers.get('Content-Type').toLowerCase()
              ? (this.isPdfContentType || (this.isPdfContentType = !0),
                void this.sendResponseObject(a, b))
              : void (
                  this.requestCounter === this.pdfFiles.length &&
                  !this.isPdfContentType &&
                  (this.sendEmptyPdfResponse(), this.resetData())
                )
            : void this.resetData()
        )
      )
      .catch(() => {
        this.sendEmptyPdfResponse();
      });
  }
  sendResponseObject(a, b) {
    if (-1 === a.indexOf('=')) {
      const c = {};
      (c.href = a),
        (c.text = this.pdfFiles[b].textContent),
        '' === c.text && (c.text = `PDF file ${this.unknownLinksCounter++}`),
        chrome.runtime.sendMessage({ type: 'renderedObj', payload: c });
    }
  }
  sendEmptyPdfResponse() {
    chrome.runtime.sendMessage({ type: 'emptyPdf' });
  }
  resetData() {
    (this.unknownLinksCounter = 1),
      (this.requestCounter = 0),
      (this.isPdfContentType = !1);
  }
}
const content = new Content();
