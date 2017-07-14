let nitrate = []
let nitrateDate = []

function populateNitrateGraph(){
  $(function () {
     Highcharts.chart('graph', {
       chart: {
           type: 'area'
       },
       title: {
           text: 'Nitrate Readings'
       },
       xAxis: {
           categories: nitrateDate
       },
       yAxis: {
           title: {
               text: 'Measurement'
           }
       },
       series: [{
           name: 'Nitrate',
           data: nitrate
       }]
     });
  });
}

function clearNitrateGraph(){
  $("#graph").empty();
}

function clearNitrateData(){
  nitrate = [];
  nitrateDate = [];
}

function getNitrate() {
  $.ajax({
    method: "GET",
    url: `${host}/api/v1/tanks/1/recent-nitrates?tank_id=1`,
    success:  function(data){
      populateNitrateReadings(data)
    }
  });
};

function populateNitrateReadings(data){
  clearNitrateData();
  data.forEach(function(reading){
    nitrate.push(reading.nitrate)
    nitrateDate.push(reading.created_at)
    clearNitrateGraph();
    populateNitrateGraph();
  })
};
