// OUXE Distribuidor - Service Worker v3 - Fix mobile download/install
const CACHE_NAME = 'ouxe-v3-' + new Date().toISOString().slice(0,10);
const CORE_ASSETS = [
  './',
  './index.html',
  './manifest.json',
  './icon-192.png',
  './icon-512.png'
];

self.addEventListener('install', (event) => {
  self.skipWaiting();
  event.waitUntil(
    caches.open(CACHE_NAME).then(cache => {
      return cache.addAll(CORE_ASSETS.map(url => new Request(url, {cache: 'reload'}))).catch(()=>{});
    })
  );
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then(keys => {
      return Promise.all(keys.filter(k => k.startsWith('ouxe-') && k !== CACHE_NAME).map(k => caches.delete(k)));
    }).then(()=> self.clients.claim())
  );
});

self.addEventListener('fetch', (event) => {
  const req = event.request;
  if (req.method !== 'GET') return;
  const url = new URL(req.url);
  // Não cacheia chamadas externas (wa.me, fonts)
  if (url.origin !== location.origin) return;
  
  // Para navegação (index.html) - network first para sempre pegar versão nova
  if (req.mode === 'navigate') {
    event.respondWith(
      fetch(req).then(res => {
        const copy = res.clone();
        caches.open(CACHE_NAME).then(c => c.put(req, copy));
        return res;
      }).catch(()=> caches.match('./index.html').then(r => r || caches.match('./')))
    );
    return;
  }

  // Para assets locais - cache first
  event.respondWith(
    caches.match(req).then(cached => {
      if (cached) return cached;
      return fetch(req).then(res => {
        if (res.ok) {
          const copy = res.clone();
          caches.open(CACHE_NAME).then(c => c.put(req, copy));
        }
        return res;
      }).catch(()=> cached);
    })
  );
});
