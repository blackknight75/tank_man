let host = "http://localhost:3000";
let ph = []
let date = []

function populatePhGraph(){
  $(function () {
     Highcharts.chart('graph', {
       chart: {
           type: 'area'
       },
       title: {
           text: 'pH Readings'
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

function clearPhGraph(){
  $("#graph").empty();
}

function clearPhData(){
  ph = [];
  date = [];
}

function getPh() {
  var tankId = $('#graph').data('tank')
  $.ajax({
    method: "GET",
    url: `${host}/api/v1/tanks/${tankId}/recent-ph?tank_id=${tankId}`,
    success:  function(data){
      populatePhReadings(data)
    }
  });
};

function populatePhReadings(data){
  clearPhData();
  data.forEach(function(reading){
    ph.push(reading.ph)
    date.push(reading.created_at)
    clearPhGraph();
    populatePhGraph();
  })
};
