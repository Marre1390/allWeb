$(document).ready(function(){
	$.ajax({
		url: "http://localhost:4433/chartjs_sodt/data.php",
		metho: "GET",
		success: function(data) {
			console.log(data);
			var mes_solicitud = [];
			var total_solicitudes = [];

			for(var i in data){
				mes_solicitud.push("Mes " + data[i].mes_solicitud);
				total_solicitudes.push(data[i].total_solicitudes);
			}

			var chartdata = {
				labels: mes_solicitud,
				datasets: [
					{
						label: 'Total solicitudes por mes',
						backgroundColor: 'rgba(100, 255, 100, 0.75)',
						borderColor: 'rgba(200, 200, 200, 0.75)',
						hoverBackgroundColor: 'rgba(200, 200, 200, 1)',
						hoverBorderColor: 'rgba(200, 200, 200, 1)',
						data: total_solicitudes
					}
				]
			};

			var ctx = $("#mycanvas");

			var barGraph = new Chart(ctx, {
				type: 'bar',
				data: chartdata
			});
		},
		error: function(data) {
			console.log(data);
		}
	});
});