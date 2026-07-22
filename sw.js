const CACHE_NAME = 'ouxe-v7';
const ASSETS = [
  './',
  './index.html',
  './Meta.html',
  './manifest.json',
  './produtos.json',
  './icon-192.png',
  './icon-512.png'
];

self.addEventListener('install', (e) => {
  e.waitUntil(
    caches.open(CACHE_NAME).then((cache) => cache.addAll(ASSETS).catch(()=>{})).then(() => self.skipWaiting())
  );
});

self.addEventListener('activate', (e) => {
  e.waitUntil(
    caches.keys().then((keys) => 
      Promise.all(keys.filter(k => k !== CACHE_NAME).map(k => caches.delete(k)))
      .then(() => self.clients.claim())
  ));
});

self.addEventListener('fetch', (e) => {
  if (e.request.method !== 'GET') return;
  const url = new URL(e.request.url);
  // For produtos.json, always try network first to get latest catalog
  if (url.pathname.endsWith('produtos.json')) {
    e.respondWith(
      fetch(e.request).then(resp => {
        const clone = resp.clone();
        caches.open(CACHE_NAME).then(cache => cache.put(e.request, clone));
        return resp;
      }).catch(() => caches.match(e.request))
    );
    return;
  }
  e.respondWith(
    caches.match(e.request).then((cached) => {
      if (cached) return cached;
      return fetch(e.request).then((resp) => {
        if (!resp || resp.status !== 200 || resp.type !== 'basic') return resp;
        const respClone = resp.clone();
        caches.open(CACHE_NAME).then((cache) => cache.put(e.request, respClone));
        return resp;
      }).catch(() => caches.match('./index.html') || caches.match('./Meta.html'));
    })
  );
});
