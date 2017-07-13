// let host = "http://localhost:3000";
let ammonia = []
let ammoniaDate = []

function populateAmmoniaGraph(){
  $(function () {
     Highcharts.chart('graph', {
       chart: {
           type: 'area'
       },
       title: {
           text: 'Ammonia Readings'
       },
       xAxis: {
           categories: ammoniaDate
       },
       yAxis: {
           title: {
               text: 'Measurement'
           }

       },
       series: [{
           name: 'Ammonia',
           data: ammonia
       }]
     });
  });
}

function clearAmmoniaGraph(){
  $("#graph").empty();
}

function clearAmmoniaData(){
  ammonia = [];
  ammoniaDate = [];
}

function getAmmonia() {
  $.ajax({
    method: "GET",
    url: `${host}/api/v1/tanks/1/recent-ammonia?tank_id=1`,
    success:  function(data){
      populateAmmoniaReadings(data)
    }
  });
};

function populateAmmoniaReadings(data){
  clearAmmoniaData();
  data.forEach(function(reading){
    ammonia.push(reading.ammonia)
    ammoniaDate.push(reading.created_at)
    clearAmmoniaGraph();
    populateAmmoniaGraph();
  })
};
