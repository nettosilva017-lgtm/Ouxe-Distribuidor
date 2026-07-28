
const CACHE_NAME = 'ouxe-v2-2026-07-28';
const ASSETS = [
  './',
  './index.html',
  './manifest.json',
  './icon-192.png',
  './icon-512.png',
  './produtos.json'
];

self.addEventListener('install', e=>{
  e.waitUntil(
    caches.open(CACHE_NAME).then(c=>c.addAll(ASSETS)).then(()=>self.skipWaiting())
  );
});

self.addEventListener('activate', e=>{
  e.waitUntil(
    caches.keys().then(keys=>Promise.all(keys.filter(k=>k!==CACHE_NAME).map(k=>caches.delete(k)))).then(()=>self.clients.claim())
  );
});

self.addEventListener('fetch', e=>{
  const req = e.request;
  const url = new URL(req.url);
  // produtos.json: network first, fallback cache
  if(url.pathname.endsWith('produtos.json')){
    e.respondWith(
      fetch(req, {cache:'no-store'}).then(res=>{
        if(res.ok){
          const clone = res.clone();
          caches.open(CACHE_NAME).then(c=>c.put(req, clone));
        }
        return res;
      }).catch(()=>caches.match(req))
    );
    return;
  }
  // images: cache first
  if(req.destination === 'image'){
    e.respondWith(
      caches.match(req).then(cached=> cached || fetch(req).then(res=>{
        if(res.ok){
          const clone=res.clone();
          caches.open(CACHE_NAME).then(c=>c.put(req, clone));
        }
        return res;
      }))
    );
    return;
  }
  // others: network first
  e.respondWith(
    fetch(req).catch(()=>caches.match(req).then(r=> r || caches.match('./index.html')))
  );
});
