'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "6efe976224713ae96351969d68594c4a",
"assets/AssetManifest.json": "2a05a7f17b8a19488a878b952026ee2f",
"assets/assets/fonts/TT-Commons-Medium.otf": "0c4e0d71a7fff703277f5fbb78116f2a",
"assets/assets/gif/dev_gif_300x200_dark.gif": "88a6b544161aaad8d6985f206f1be09b",
"assets/assets/gif/dev_gif_300x200_light.gif": "21c751f3bf4717d4566282f122ee2c64",
"assets/assets/images/cards/custom_card.svg": "aac8baf6872db838689c44bf5a1b22bf",
"assets/assets/images/cards/integration_card.svg": "cb13b67a37a2124fd6be966da27f344c",
"assets/assets/images/cards/mobile_card.svg": "95fe0935bc6b351992050f60e811a799",
"assets/assets/images/cards/refactor_card.svg": "afa64080325f5f9287bff06788f647c5",
"assets/assets/images/cards/web_card.svg": "ff274b1187531589bdfaa2f617d654ee",
"assets/assets/images/client/eurocontrol.png": "dd9bcf58b142d929c27ba829987d0f53",
"assets/assets/images/client/fortech.png": "5a40f952e397aa5e6a8ab82abe50624a",
"assets/assets/images/client/mercedes.png": "109d5bcfc9f1c32e590488a942bc00fe",
"assets/assets/images/client/orange.svg": "51c65da136552411c395fd12b43045e2",
"assets/assets/images/client/revolut.svg": "d453512ee34e26994cc2fc36c92e4b88",
"assets/assets/images/devbutton.svg": "fcd684c355c8b37d2a83c2420a75f10b",
"assets/assets/images/tools/azure.svg": "85b0d2d80c99092463c84e08f7a42230",
"assets/assets/images/tools/confluence.svg": "d5df14d45a6bb622e40c2b60f0a1613b",
"assets/assets/images/tools/docker.svg": "9cea44c3a2b06a538570986c2e88883d",
"assets/assets/images/tools/flutter.svg": "a3db7778851808ec740a26617e6ca41d",
"assets/assets/images/tools/git.svg": "5cb92fedd54485318793a0e2331f84ee",
"assets/assets/images/tools/google-cloud.svg": "be6d4cff236a4ffd75d17205ad1ac975",
"assets/assets/images/tools/gradle.svg": "218aaa30d8960dbb3a008331f8a6448e",
"assets/assets/images/tools/intellij-idea.svg": "e8b73aaa33972def77c2e56d4f86df01",
"assets/assets/images/tools/java.svg": "e9bba1c5647be8569856fbbf1cf59c90",
"assets/assets/images/tools/jira.svg": "7b9c8242b9057351077d4db7ef357b40",
"assets/assets/images/tools/maven.svg": "af6320967415b9ab2225a7f335c1fa46",
"assets/assets/images/tools/mysql.svg": "87edff0362a3b107c60d9882a0429280",
"assets/assets/images/tools/postgresql.svg": "864da52b1932f0bf963daf2e62394f8d",
"assets/assets/images/tools/spring-boot.svg": "86f3d2051757c2ab2185bf36b4d2d58b",
"assets/FontManifest.json": "f4d3bed99dd6fa620a6f44e83f03fb0b",
"assets/fonts/MaterialIcons-Regular.otf": "60f98e1b6432424dbb8adb9857a0bc5c",
"assets/NOTICES": "b0bbb639bfcca727b2d0c920d7a6d822",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d7791ef376c159f302b8ad90a748d2ab",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "5070443340d1d8cceb516d02c3d6dee7",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "658b490c9da97710b01bd0f8825fce94",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "d10ac4ee5ebe8c8fff90505150ba2a76",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"dev.png": "b9b6f36232f3ebb83393b34ce1813515",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "b29b51294691c0515c435dc7d73cc0fa",
"/": "b29b51294691c0515c435dc7d73cc0fa",
"main-icon.png": "c1e436b1c29204d242c34a8417f01c11",
"main.dart.js": "7cf36fc3be007a1f61f2c6a61de39c66",
"manifest.json": "73e9efd496d11e66924d450691f8a1c0",
"version.json": "acc36dacf8e4432afbd1ab5935ebf213"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
