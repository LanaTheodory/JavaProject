function initMap() {
  const myLatLng = { lat: 31.964956, lng: 35.186712 };
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 13,
    center: myLatLng,
  });
  new google.maps.Marker({
    position: { lat: 31.964956, lng: 35.186712 },
    map,
    title: "Hello World!",
  });
}