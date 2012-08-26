var genChart = function (chartData) {
    var chart;
    $(document).ready(function() {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'scatter',
                margin: [70, 50, 60, 80],
                events: {
                    click: function(e) {
                        // find the clicked values and the series
                        var x = e.xAxis[0].value,
                            y = e.yAxis[0].value,
                            series = this.series[0];
    
                        // Add it
                        series.addPoint([x, y]);
    
                    }
                }
            },
            title: {
                text: 'TSP Data'
            },
            subtitle: {
                text: 'Select different TSP files from the drop-down above'
            },
            xAxis: {
                title: {
                    text: 'X'
                },
                minPadding: 0.2,
                maxPadding: 0.2,
                maxZoom: 60
            },
            yAxis: {
                title: {
                    text: 'Y'
                },
                minPadding: 0.2,
                maxPadding: 0.2,
                maxZoom: 60,
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            legend: {
                enabled: false
            },
            exporting: {
                enabled: false
            },
            plotOptions: {
                series: {
                    lineWidth: 0,
                    point: {
                        events: {
                            'click': function() {
                                if (this.series.data.length > 1) this.remove();
                            }
                        }
                    }
                }
            },
            series: [{
                data: chartData
            }]
        });
    });
    
};


$(document).ready(function () {
    $('#tsp-dropdown').change(function () {
        var group = $('#tsp-dropdown option:selected').text();
        $.ajax({
            url: '/tsp/' + group,
            datatype: 'json',
            success: function (data) {
                console.log(data);
                genChart(data);
            }
        });
    }).trigger('change');
});
