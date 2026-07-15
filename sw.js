const CACHE_NAME = 'ouxe-v1.0.3';
const ASSETS = [
  './',
  './index.html',
  './manifest.json',
  './icon-32.png',
  './icon-72.png',
  './icon-96.png',
  './icon-128.png',
  './icon-144.png',
  './icon-152.png',
  './icon-192.png',
  './icon-384.png',
  './icon-512.png'
];

self.addEventListener('install', (e) => {
  e.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll(ASSETS);
    })
  );
  self.skipWaiting();
});

self.addEventListener('activate', (e) => {
  e.waitUntil(
    caches.keys().then((keys) => {
      return Promise.all(keys.filter(k => k !== CACHE_NAME).map(k => caches.delete(k)));
    })
  );
  self.clients.claim();
});

self.addEventListener('fetch', (e) => {
  // Skip non-GET and chrome extensions
  if (e.request.method !== 'GET' || e.request.url.startsWith('chrome-extension://')) return;
  
  e.respondWith(
    caches.match(e.request).then((cached) => {
      // Return cached or fetch network
      return cached || fetch(e.request).then((res) => {
        // Cache new resources
        if (res.ok && e.request.url.startsWith(self.location.origin)) {
          const clone = res.clone();
          caches.open(CACHE_NAME).then(c => c.put(e.request, clone));
        }
        return res;
      }).catch(() => {
        // Fallback for offline navigation
        if (e.request.destination === 'document') {
          return caches.match('./index.html');
        }
      });
    })
  );
});