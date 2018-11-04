// PAGE LEVEL SCRIPTS
loadScript(plugin_path + 'chart.chartjs/Chart.min.js', function () {
    var barChartCanvas = {
        labels: ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"],
        datasets: [
            {
                fillColor: "rgba(220,220,220,0.5)",
                strokeColor: "rgba(220,220,220,0.8)",
                highlightFill: "rgba(220,220,220,0.75)",
                highlightStroke: "rgba(220,220,220,1)",
                data: [65, 59, 90, 81, 56, 55, 50]
            }
        ]
    };

    var ctx = document.getElementById("barChartCanvas").getContext("2d");
    new Chart(ctx).Bar(barChartCanvas);
});
