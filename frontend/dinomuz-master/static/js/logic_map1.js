var map1 = L.map('map1', {
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
).addTo(map1);

/*
var xmlhttp = new XMLHttpRequest();
var url = 'https://election-2018-analysis.herokuapp.com/api/map';

xmlhttp.onreadystatechange = function() {
  if (this.readyState == 4 && this.status == 200) {
    var data = JSON.parse(this.responseText);
    console.log('Requesting xmlhttp');
    console.log(data);

    //  myFunction(myArr);
  }
};

xmlhttp.open('GET', url, true);
xmlhttp.send();
*/

var oise = 'cb_2017_us_cd115_20m.json';

var results_file = '116th_us_congress_list.json';

// console.log(district_data.party);

function complete(district_data) { 
  function getColor(d) {
    return d/700000 > 0.8 ? '#0000ff' :
      d/700000 > 0.6 ? '#ac0dcd' :
      d/700000 > 0.45 ? '#dd47a2' :
      d/700000 > 0.35 ? '#f77985' :
      d/700000 > 0.3 ? '#ffaa80' :
      d/700000 > 0.25 ? '#ffd79e' :
      d/700000 > 0.1 ? '#ffffe0' :
      '#000000';
  }

  // coordinate GEOID and party affiliation
  var STATEFP_CD115FP = {};
  var data = district_data.data;

  //   console.log(data);

  for (var i = 0; i < data.length; i += 1) {
    STATEFP_CD115FP[data[i].GEOID] = data[i].employment;
  }

  for (var i = 0; i < data.length; i += 1) {
    STATEFP_CD115FP[data[i].STATEFP] = data[i].state;
  }


   var STATEFP_CD115FP2 = {},
     data2 = district_data.data;
 
   // console.log(data);
 
   for (var i = 0; i < data2.length; i += 1) {
     STATEFP_CD115FP2[data2[i].GEOID] = data2[i].party;
   }
  // for (var i = 0; i < data.length; i += 1) {
  //    (STATEFP_CD115FP[data[i].CD115FP] = data[i].district);
  //  }

  var jqxhr2 = $.getJSON(oise, function(data_shape) {
    console.log('success shape_file');
    shape_files = data_shape;
    console.log(shape_files);

  var shape_file_Layer2 = new L.geoJson(shape_files, {
    style: function(feature) {
      
      return {
        weight: 0.3,
        opacity: 1,
        color: 'white',
        fillOpacity: 0.9,
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
            fillOpacity: 1.0,
            weight: 4,
            color: 'lightblue',
          });
        },
        // When the cursor no longer hovers over a map feature - when the mouseout event occurs - the feature's opacity reverts back to 50%
        mouseout: function(event) {
          layer = event.target;
          layer.setStyle({
            fillOpacity: 0.9,
            weight: 0.3,
            color: 'white',
          });
        },
        // When a feature (neighborhood) is clicked, it is enlarged to fit the screen
        click: function(event) {
          map1.fitBounds(event.target.getBounds());
            layer.setStyle({
            fillOpacity: 0.3,
            weight: 0.3
          });
        }
      });
      // Giving each feature a pop-up with information pertinent to it
      layer.bindPopup(
        "<h5>" + 
        (STATEFP_CD115FP[feature.properties.STATEFP]) +
         "</h5> <hr> <h6>" + 
         "District: " +
         feature.properties.CD115FP + 
         "</h6> <h6>" + 
         "Winning Party: " + 
         STATEFP_CD115FP2[feature.properties.GEOID] +
         "</h6> <h6>" + 
         "Employment Rate: " + 
         ((STATEFP_CD115FP[feature.properties.GEOID])/750000) + 
         "</h6>"
      );
    }

      // NEW INSERTION FOR POP-UP END
    }).addTo(map1);
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

var jqxhr3 = $.getJSON(results_file, function(district_data_orig) {
  console.log('success district_data');
  // console.log(district_data_orig);

  complete(district_data_orig);
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
