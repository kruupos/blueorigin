$(function(){
  var markersArr = [];

  for (i in cities) {
      markersArr.push({
          name: cities[i].name,
          latLng: [cities[i].latitude, cities[i].longitude]
      });
    }
  $('#world-map').vectorMap({
    map: 'world_mill',
    scaleColors: ['#C8EEFF', '#0071A4'],
    normalizeFunction: 'polynomial',
    hoverOpacity: 0.7,
    hoverColor: false,
    markerStyle: {
      initial: {
        fill: '#F8E23B',
        stroke: '#383f47'
      }
    },
    backgroundColor: '#383f47',
    markers: markersArr,
  });
});

$(function(){
  $('.datepicker').datepicker({
    todayHighlight: true, 
    orientation: 'auto top', 
    format: 'yyyy-mm-dd',
    startDate: '1d'
  });
});