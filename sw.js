const CACHE_NAME = 'ouxe-distribuidor-no-images-v1';
const urlsToCache = [
  '/',
  '/index.html',
  '/manifest.json'
];

self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then((cache) => cache.addAll(urlsToCache))
      .catch(err => console.log('[SW] Erro ao carregar cache de inicialização:', err))
  );
  self.skipWaiting();
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((names) => Promise.all(
      names.filter(n => n !== CACHE_NAME).map(n => caches.delete(n))
    ))
  );
  self.clients.claim();
});

self.addEventListener('fetch', (event) => {
  event.respondWith(
    caches.match(event.request).then((response) => {
      if (response) return response;
      return fetch(event.request).then((res) => {
        // Não cacheia requisições que não sejam locais ou seguras (ex: base64 muito longas)
        if (!res || res.status !== 200 || res.type !== 'basic') return res;
        
        const clone = res.clone();
        caches.open(CACHE_NAME).then((cache) => cache.put(event.request, clone));
        return res;
      }).catch(() => {
        if (event.request.mode === 'navigate') return caches.match('/index.html');
      });
    })
  );
});