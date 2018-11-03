$(document).ready(function(){

    Chart.defaults.global.defaultFontFamily = "Lato";
    Chart.defaults.global.defaultFontSize = 18;

    $.ajax({
        url: "http://localhost:4433/chartjs_sodt/data_servicios.php",
        metho: "GET",
        success: function(data) {
            console.log(data);
            var servicio = [];
            var total_servicio = [];

            for(var i in data){
                servicio.push(data[i].txt_servicio);
                total_servicio.push(data[i].servicio);
            }

            var oildata = {
                labels: servicio,
                datasets: [
                    {
                        data: total_servicio,
                        backgroundColor: [
                            "#FF6384",
                            "#63FF84",
                            "#84FF63",
                            "#8463FF",
                            "#6384FF"
                        ]
                    }
                ]
            };

            var ctx = $("#oilChart");

            var pieGraph = new Chart(ctx, {
                type: 'pie',
                data: oildata
            });
        },
        error: function(data) {
            console.log(data);
        }
    });
});

