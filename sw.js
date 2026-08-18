// OUXE Distribuidor - Service Worker v4 - FIX WhatsApp
const CACHE_NAME = 'ouxe-v4-stable';
const CORE_ASSETS = [
  './',
  './index.html',
  './manifest.json'
  // REMOVIDO icon-192.png e icon-512.png daqui - se não existir quebra o install
  // Eles serão cacheados sob demanda
];

self.addEventListener('install', (event) => {
  self.skipWaiting();
  event.waitUntil(
    caches.open(CACHE_NAME).then(cache => {
      return cache.addAll(CORE_ASSETS).catch(err=>{
        console.log('SW cache addAll parcial', err);
        // tenta um por um
        return Promise.allSettled(CORE_ASSETS.map(u=>cache.add(new Request(u,{cache:'reload'}))));
      });
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
  if (url.origin !== location.origin) return;
  // Ignora chamadas de API ou wa.me
  if (url.pathname.includes('/api/')) return;

  if (req.mode === 'navigate') {
    event.respondWith(
      fetch(req).then(res => {
        const copy = res.clone();
        caches.open(CACHE_NAME).then(c => c.put(req, copy));
        return res;
      }).catch(()=> caches.match('./index.html').then(r => r || caches.match('./')) || caches.match('/'))
    );
    return;
  }

  event.respondWith(
    caches.match(req).then(cached => {
      if (cached) return cached;
      return fetch(req).then(res => {
        if (res.ok && res.type === 'basic') {
          const copy = res.clone();
          caches.open(CACHE_NAME).then(c => c.put(req, copy));
        }
        return res;
      }).catch(()=> cached);
    })
  );
});
