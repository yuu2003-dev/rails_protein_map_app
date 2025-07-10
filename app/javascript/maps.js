function initMap() {
  const map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 35.6895, lng: 139.6917 }, // 東京
    zoom: 12,
  });

  fetch('/shops.json')
    .then(response => response.json())
    .then(shops => {
      shops.forEach(shop => {
        new google.maps.Marker({
          position: { lat: shop.latitude, lng: shop.longitude },
          map: map,
          title: shop.name
        });
      });
    });
}

window.initMap = initMap;
