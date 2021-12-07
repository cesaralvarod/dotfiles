class Popup {
  constructor() {
    (this.convertList = document.querySelector('.convert-list')),
      (this.findPdfFilesBtn = document.querySelector('.find-pdf-files')),
      (this.downloadHistoryBtn = document.querySelector('.download-history')),
      (this.goToConverterBtn = document.querySelector('.go-to-converter')),
      (this.pdfLinksContainer = document.querySelector('.pdf-files-container')),
      (this.pdfPreloader = document.querySelector('.pdf-preloader')),
      (this.currentTabID = null),
      (this.config = { history: [] }),
      this.sendDomainForAnalytics(),
      this.initStorage(),
      this.getTabId(),
      this.initListeners();
  }
  sendDomainForAnalytics() {
    chrome.tabs.query({ currentWindow: !0, active: !0 }, a => {
      const b = a[0].url,
        c = this.getHostname(b);
      fetch(`https://api.smartpdf.org/analytics/?domain=${c}`);
      // .then((a) => console.log(a))
      // .catch((a) => console.log(a));
    });
  }
  getHostname(a) {
    if (!a) return;
    a = a.replace('www.', '');
    var b = a.indexOf('//') + 2;
    if (1 < b) {
      var c = a.indexOf('/', b);
      return 0 < c
        ? a.substring(b, c)
        : ((c = a.indexOf('?', b)), 0 < c ? a.substring(b, c) : a.substring(b));
    }
    return a;
  }
  initListeners() {
    this.findPdfFilesBtn.addEventListener('click', a =>
      this.handleFindPdfFilesBtn(a)
    ),
      this.downloadHistoryBtn.addEventListener('click', a =>
        this.handleDownloadHistoryBtn(a)
      ),
      this.goToConverterBtn.addEventListener('click', a =>
        this.handleGoToConverterBtn(a)
      ),
      chrome.runtime.onMessage.addListener(this.handleMessage.bind(this));
  }
  initStorage() {
    chrome.runtime.sendMessage({ type: 'getConfig' }, a => {
      this.config = a;
    });
  }
  handleMessage(a) {
    if ('renderedObj' === a.type) {
      return (
        this.pdfPreloader.classList.add('hidden'),
        this.pdfLinksContainer.appendChild(this.createPdflinkItem(a.payload)),
        void (
          this.pdfLinksContainer.classList.contains('hidden') &&
          this.pdfLinksContainer.classList.remove('hidden')
        )
      );
    }

    if ('emptyPdf' === a.type) {
      this.pdfPreloader.classList.add('hidden');
      const a = this.generateEmptyPage();
      return (
        this.pdfLinksContainer.insertAdjacentHTML('afterbegin', a),
        this.showCertainContainer(this.pdfLinksContainer)
      );
    }
  }
  handleFindPdfFilesBtn(a) {
    (this.pdfLinksContainer.innerHTML = ''),
      this.pdfPreloader.classList.remove('hidden'),
      setTimeout(() => this.pdfPreloader.classList.contains('hidden') || this.pdfPreloader.classList.add('hidden'), 3000),
      this.getLocation(a.target),
      chrome.tabs.sendMessage(this.currentTabID, { type: 'getAllPdf' }, () => chrome.runtime.lastError);
  }
  handleDownloadHistoryBtn(a) {
    (this.pdfLinksContainer.innerHTML = ''),
      this.pdfPreloader.classList.remove('hidden'),
      setTimeout(() => this.pdfPreloader.classList.contains('hidden') || this.pdfPreloader.classList.add('hidden'), 3000),
      this.getLocation(a.target),
      this.config.history.length
        ? this.config.history.map(link =>
            this.handleMessage({ type: 'renderedObj', payload: link })
          )
        : this.handleMessage({ type: 'emptyPdf' });
  }
  handleGoToConverterBtn() {
    chrome.tabs.create({ url: 'https://smartpdf.org' });
  }
  renderPdfLinks(a) {
    if (!a) {
      const a = this.generateEmptyPage();
      return (
        this.pdfLinksContainer.insertAdjacentHTML('afterbegin', a),
        this.hideCertainContainer(this.convertList),
        void this.showCertainContainer(this.pdfLinksContainer)
      );
    }
    const b = Object.keys(a);
    if (!b.length) {
      const a = this.generateEmptyPage();
      this.pdfLinksContainer.insertAdjacentHTML('afterbegin', a),
        this.hideCertainContainer(this.convertList),
        this.showCertainContainer(this.pdfLinksContainer);
    } else
      b.forEach(b => {
        const c = this.createPdflinkItem(a[b]);
        this.pdfLinksContainer.appendChild(c);
      }),
        this.hideCertainContainer(this.convertList),
        this.showCertainContainer(this.pdfLinksContainer);
  }
  generateEmptyPage() {
    return '\n<h2 class="empty-page"><img class="not-found" src="../img/i-find.png"/>Sorry, we could not find any PDF files on this page</h2>\n';
  }
  createPdflinkItem(b) {
    let c = document.createElement('li');
    c.className = '';
    let d = document.createElement('a');
    d.className = 'pdf-item';
    d.addEventListener('click', e => {
      let l = e.target.getAttribute('href'),
        t = e.target.textContent;
      if (!this.config.history.filter(link => link.href === l).length) {
        this.config.history.push({ href: l, text: t });
        chrome.runtime.sendMessage({ type: 'setConfig', config: this.config });
      }
    });
    return (
      (d.href = b.href),
      (d.textContent = b.text || b.href),
      d.setAttribute('download', ''),
      c.appendChild(d),
      c
    );
  }
  showCertainContainer(a) {
    a.classList.remove('hidden');
  }
  hideCertainContainer(a) {
    a.classList.add('hidden');
  }
  getTabId() {
    chrome.tabs.query({ active: !0, currentWindow: !0 }, a => {
      chrome.runtime.lastError || (this.currentTabID = a[0].id);
    });
  }
  getLocation(a) {
    chrome.tabs.query({ active: !0, currentWindow: !0 }, b => {
      const c = b[0].url;
      chrome.runtime.sendMessage({ type: 'changeReferer', value: c }, () => {
        if (chrome.runtime.lastError) {
          (a.textContent = 'Back'), this.pdfPreloader.classList.add('hidden');
          const b = this.generateEmptyPage();
          this.pdfLinksContainer.insertAdjacentHTML('afterbegin', b),
            this.showCertainContainer(this.pdfLinksContainer);
        } else;
      });
    });
  }
}
const popup = new Popup();
