var map_index = L.map('map_index', {
  center: [39.8283, -98.5795],
  zoom: 4
});

// Adding tile layer
L.tileLayer(
  'https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}',
  {
    attribution:
      'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 10,
    id: 'mapbox.light',
    accessToken: API_KEY
  }
).addTo(map_index);

var oise = 'cb_2017_us_cd115_20m.json';

var results_file = '116th_us_congress_list.json';

function complete(district_data) {
  function getColor(d1) {
    return d1 == 'REP'
      ? '#800026'
      : d1 == 'DEM'
      ? '#0000ff'
      : d1 == 'DFL'
      ? '#0000ff'
      : '#000000';
  }

  // coordinate GEOID and party affiliation
  var STATEFP_CD115FP = {},
    data = district_data.data;

  // console.log(data);

  for (var i = 0; i < data.length; i += 1) {
    STATEFP_CD115FP[data[i].GEOID] = data[i].party;
  }

  for (var i = 0; i < data.length; i += 1) {
    STATEFP_CD115FP[data[i].STATEFP] = data[i].state;
  }

  var STATEFP_CD115FP2 = {},
    data2 = district_data.data;

  // console.log(data);

  for (var i = 0; i < data2.length; i += 1) {
    STATEFP_CD115FP2[data2[i].GEOID] = data2[i].name;
  }

  //   for (var i = 0; i < data.length; i += 1) {
  //    (STATEFP_CD115FP[data[i].party] = data[i].party);
  //  }

  // for (var i = 0; i < data.length; i += 1) {
  //    (STATEFP_CD115FP[data[i].CD115FP] = data[i].district);
  //  }
  var jqxhr = $.getJSON(oise, function(data_shape) {
    console.log('success shape_file');
    shape_files = data_shape;
    console.log(shape_files);

    var shape_file_Layer1 = new L.geoJson(shape_files, {
      style: function(feature) {
        return {
          weight: 0.6,
          opacity: 1,
          color: 'black',
          fillOpacity: 0.8,
          fillColor: getColor(STATEFP_CD115FP[feature.properties.GEOID])
        };
      },

      // NEW INSERTION FOR POP-UP

      // Called on each feature
      onEachFeature: function(feature, layer) {
        // Set mouse events to change map styling
        layer.on({
          // When a user's mouse touches a map feature, the mouseover event calls this function, that feature's opacity changes to 90% so that it stands out
          mouseover: function(event) {
            layer = event.target;
            layer.setStyle({
              fillOpacity: 1
            });
          },
          // When the cursor no longer hovers over a map feature - when the mouseout event occurs - the feature's opacity reverts back to 50%
          mouseout: function(event) {
            layer = event.target;
            layer.setStyle({
              fillOpacity: 0.8
            });
          }
          // When a feature (neighborhood) is clicked, it is enlarged to fit the screen
              // click: function(event) {
              //   map_index.fitBounds(event.target.getBounds());
              // }
        });
        // Giving each feature a pop-up with information pertinent to it
        layer.bindPopup(
          '<h5>' +
            STATEFP_CD115FP[feature.properties.STATEFP] +
            '</h5> <hr> <h6>' +
            'District: ' +
            feature.properties.CD115FP +
            '</h6> <h6>' +
            'Party: ' +
            STATEFP_CD115FP[feature.properties.GEOID] +
            '</h6> <h6>' +
            'Name: ' +
            STATEFP_CD115FP2[feature.properties.GEOID] +
            '</h6>'
        );
      }

      // NEW INSERTION FOR POP-UP END
    }).addTo(map_index);
  })
    .done(function() {
      console.log('second success shape_file');
    })
    .fail(function() {
      console.log('error shape_file');
    })
    .always(function() {
      console.log('complete shape_file');
    });
}

var jqxhr1 = $.getJSON(results_file, function(district_data) {
  console.log('success district_data');
  // console.log(district_data_orig);

  complete(district_data);
})
  .done(function() {
    console.log('second success district_data');
  })
  .fail(function() {
    console.log('error district_data');
  })
  .always(function() {
    console.log('complete district_data');
  });

// from stack overflow example: https://stackoverflow.com/questions/35793471/define-json-polygons-color-by-data-from-csv-in-leaflet
