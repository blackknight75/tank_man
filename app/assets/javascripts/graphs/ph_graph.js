$(function () {
 Highcharts.chart('ph-graph', {
   chart: {
       type: 'line'
   },
   title: {
       text: 'Water Parameters'
   },
   xAxis: {
       categories: ['Apples', 'Bananas', (new Date).getDate()]
   },
   yAxis: {
       title: {
           text: 'Measurement'
       }

   },
   series: [{
       name: 'pH',
       data: [7.9, 8.2, 8.1]
   }]
 });
});
