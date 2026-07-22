const CACHE_NAME = 'ouxe-v10-polido';
const ASSETS = [
  './',
  './index.html',
  './manifest.json',
  './icon-192.png',
  './icon-512.png'
];

self.addEventListener('install', (event) => {
  console.log('[SW v9] Install - limpando cache antigo e instalando novo');
  event.waitUntil(
    caches.keys().then(keys => 
      Promise.all(keys.filter(k => k !== CACHE_NAME).map(k => caches.delete(k)))
    ).then(() => 
      caches.open(CACHE_NAME).then(cache => {
        return cache.addAll(ASSETS.map(url => new Request(url, {cache: 'no-store'}))).catch(err => {
          console.log('[SW] addAll falhou, tentando individual', err);
          return Promise.allSettled(ASSETS.map(url => cache.add(url).catch(()=>{})));
        });
      })
    ).then(() => self.skipWaiting())
  );
});

self.addEventListener('activate', (event) => {
  console.log('[SW v9] Activate - assumindo controle');
  event.waitUntil(
    caches.keys().then(keys => 
      Promise.all(keys.filter(k => k !== CACHE_NAME).map(k => caches.delete(k)))
    ).then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', (event) => {
  const request = event.request;
  const url = new URL(request.url);
  
  if (request.method !== 'GET') return;
  if (!url.protocol.startsWith('http')) return;
  
  // HTML - NETWORK FIRST (sempre pega versão mais nova, evita mostrar página velha sem produtos)
  if (request.headers.get('accept')?.includes('text/html') || url.pathname.endsWith('.html') || url.pathname === '/' || url.pathname.endsWith('/')) {
    event.respondWith(
      fetch(request, {cache: 'no-store'})
        .then(response => {
          if (response.ok) {
            const clone = response.clone();
            caches.open(CACHE_NAME).then(cache => cache.put(request, clone));
          }
          return response;
        })
        .catch(() => {
          return caches.match(request).then(cached => {
            if (cached) return cached;
            return caches.match('./index.html').then(fallback => fallback || caches.match('./'));
          });
        })
    );
    return;
  }
  
  // Outros - cache first com update em background
  event.respondWith(
    caches.match(request).then(cached => {
      if (cached) {
        event.waitUntil(
          fetch(request).then(r => {
            if (r.ok) caches.open(CACHE_NAME).then(c => c.put(request, r));
          }).catch(()=>{})
        );
        return cached;
      }
      return fetch(request).then(response => {
        if (!response || !response.ok) return response;
        const clone = response.clone();
        caches.open(CACHE_NAME).then(cache => cache.put(request, clone));
        return response;
      });
    })
  );
});

self.addEventListener('message', (event) => {
  if (event.data && event.data.type === 'SKIP_WAITING') self.skipWaiting();
});
