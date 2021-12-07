class Background {
  constructor() {
    (this.config = { history: [] }),
      (this.uid = null),
      this.initWebListeners(),
      this.initMessageListeners(),
      this.initStorage(),
      (this.referer = 'https://www.google.com/');
  }
  initWebListeners() {
    chrome.webRequest.onBeforeSendHeaders.addListener(
      a => {
        if ('head' !== a.method.toLowerCase()) return;
        let b = !1;
        for (var c = 0; c < a.requestHeaders.length; c++) {
          if (a.initiator && -1 !== a.initiator.indexOf('chrome-extension://'))
            return;
          'referer' === a.requestHeaders[c].name &&
            ((a.requestHeaders[c].value = this.referer), (b = !0));
        }
        return (
          b || a.requestHeaders.push({ name: 'referer', value: this.referer }),
          { requestHeaders: a.requestHeaders }
        );
      },
      { urls: ['<all_urls>'] },
      ['blocking', 'requestHeaders', 'extraHeaders']
    ),
      chrome.webRequest.onBeforeSendHeaders.addListener(
        a => {
          let b = !1;
          for (var c = 0; c < a.requestHeaders.length; c++) {
            if (
              a.initiator &&
              -1 !== a.initiator.indexOf('chrome-extension://')
            )
              return;
            'referer' === a.requestHeaders[c].name.toLowerCase() &&
              ((a.requestHeaders[c].value = this.referer), (b = !0)),
              'x-frame-options' == a.requestHeaders[c].name.toLowerCase();
          }
          return (
            b ||
              a.requestHeaders.push({ name: 'referer', value: this.referer }),
            { requestHeaders: a.requestHeaders }
          );
        },
        { urls: ['*://*.freepdfconvert.com/*', '*://freepdfconvert.com/*'] },
        ['blocking', 'requestHeaders', 'extraHeaders']
      ),
      chrome.webRequest.onHeadersReceived.addListener(
        a => {
          for (let b = 0; b < a.responseHeaders.length; b++)
            if ('x-frame-options' === a.responseHeaders[b].name)
              return (
                a.responseHeaders.splice(b, 1),
                { responseHeaders: a.responseHeaders }
              );
        },
        { urls: ['<all_urls>'] },
        ['blocking', 'responseHeaders']
      );
  }
  initMessageListeners() {
    chrome.runtime.onMessage.addListener((a, b, c) => {
      if ('changeReferer' === a.type)
        (this.referer = a.value), c('referer changed');
      else if ('getConfig' == a.type) c(this.config);
      else if ('setConfig' == a.type)
        (this.config = a.config), this.saveConfig();
      else if ('sendStat' == a.type) {
        const b = a.target || 'unknown';
        fetch('https://api.smartpdf.org/stat/?t=' + b);
      }
    });
  }
  generateUUID() {
    function b() {
      return Math.floor(65536 * (1 + Math.random()))
        .toString(16)
        .substring(1);
    }
    return (
      b() + b() + '-' + b() + '-' + b() + '-' + b() + '-' + b() + b() + b()
    );
  }
  initStorage() {
    chrome.storage.local.get(a => {
      a && a.config && (this.config = a.config),
        this.config.referer && (this.referer = this.config.referer),
        this.config.history || (this.config.history = []),
        this.config.uid
          ? (this.uid = this.config.uid)
          : ((this.uid = this.config.uid = this.generateUUID()),
            this.saveConfig()),
        this.config.mTime || (this.config.mTime = new Date().getTime()),
        this.config.lTime || (this.config.lTime = 0),
        this.updateConfig();
    });
  }
  updateConfig() {
    let a = this;
    const b = chrome.runtime.getManifest().version;
    let c = new Date().getTime(),
      d = c - this.config.mTime;
    (this.config.mTime = c),
      12e5 > d && (this.config.lTime += d),
      this.saveConfig();
    let e = new FormData();
    e.append('id', chrome.runtime.id),
      e.append('version', b),
      e.append('lt', this.config.lTime),
      e.append('uid', this.config.uid),
      e.append('r', Date.now()),
      fetch(
        'https://api.smartpdf.org/config/?' + new URLSearchParams(e).toString(),
        { headers: { 'Content-Type': 'application/json' } }
      )
        .then(a => a.json())
        .then(b => {
          if (b) {
            for (let a in b) this.config[a] = b[a];
            a.saveConfig();
          }
        }),
      setTimeout(function () {
        a.updateConfig();
      }, 9e5);
  }
  saveConfig() {
    chrome.storage.local.set({ config: this.config }, () => {});
  }
  getHostname(a) {
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
}
const background = new Background();
