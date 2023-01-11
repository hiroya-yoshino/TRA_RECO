function initMap(){
    // 地図の位置情報(緯度・経度)を取得
    let mapPosition = {lat: post_detail.latitude.presence || 0 , lng: post_detail.longitude.presence || 0 };
    let map = new google.maps.Map(document.getElementById('map'), {
      zoom: 15,
      center: mapPosition
    });
    let transitLayer = new google.maps.TransitLayer();
    transitLayer.setMap(map);

    let contentString = '【住所】<%= @post_detail.address %>';
    let infowindow = new google.maps.InfoWindow({
      content: contentString
    });

    let marker = new google.maps.Marker({
      position: mapPosition,
      map: map,
      title: contentString
    });

    marker.addListener('click', function(){
      infowindow.open(map, marker);
    });
  }