const host = "http://localhost:3000";
const ph = []
const date = []

function populatePhGraph(){
  $(function () {
     Highcharts.chart('ph-graph', {
       chart: {
           type: 'line'
       },
       title: {
           text: 'Water Parameters'
       },
       xAxis: {
           categories: date
       },
       yAxis: {
           title: {
               text: 'Measurement'
           }

       },
       series: [{
           name: 'pH',
           data: ph
       }]
     });
  });
}
function getPh() {
  $.ajax({
    method: "GET",
    url: `${host}/api/v1/tanks/1/recent-ph?tank_id=1`,
    success:  function(data){
      populatePhReadings(data)
    }
  });
};

function populatePhReadings(data){
  data.forEach(function(reading){
    ph.push(reading.ph)
    date.push(reading.created_at)
    populatePhGraph()
  })
};

  // getPh()
