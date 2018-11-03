$(document).ready(function(){

    Chart.defaults.global.defaultFontFamily = "Lato";
    Chart.defaults.global.defaultFontSize = 18;

    $.ajax({
        url: "http://localhost:4433/chartjs_sodt/data_responsetime.php",
        metho: "GET",
        success: function(data) {
            console.log(data);
            var solicitudes = [];
            var responsetime = [];

            for(var i in data){
                solicitudes.push(data[i].solicitudes);
                responsetime.push(data[i].responsetime);
            }

            var speedData = {
              labels: ["0d", "10d", "20d", "30d", "40d", "50d", "60d"],
              datasets: [{
                label: "Tiempo de Respuesta (promedio en dias)",
                data: [0, 59, 75, 20, 20, 55, 40],
              }]
            };

            var chartOptions = {
              legend: {
                display: true,
                position: 'top',
                labels: {
                  boxWidth: 80,
                  fontColor: 'black'
                }
              }
            };

            var ctx = $("#speedChart");

            var pieGraph = new Chart(ctx, {
                type: 'line',
                data: speedData,
                options: chartOptions
            });
        },
        error: function(data) {
            console.log(data);
        }
    });
});
