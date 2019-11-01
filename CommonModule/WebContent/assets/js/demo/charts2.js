/*
 * MoonCake v1.3.1 - Charts Demo JS
 *
 * This file is part of MoonCake, an Admin template build for sale at ThemeForest.
 * For questions, suggestions or support request, please mail me at maimairel@yahoo.com
 *
 * Development Started:
 * July 28, 2012
 * Last Update:
 * December 07, 2012
 *
 */

;(function( $, window, document, undefined ) {

	var demos = {
		
		lineCharts: function( target ,response) {
			//alert("response line chart :"+response);
			var x= response;
			var obj;
			var d3=[];
			/*for(var i=0;i<50;i++){
				d3.push(i);
			}*/
			if (x === undefined) {
				  // alert( "x is undefined");
				} else {
					obj = JSON.parse(response.trim());
				   // alert( "x is defined"+obj.barChatData.length);
				    for(var i=0;i<obj.barChatData.length;i++){
						d3.push(obj.barChatData[i].count);
					}
				}
			
			var 			
			d2 = d3, 
		
			options = {
				series: {
					lines: { 
						show: true, 
						fill: true, 
						lineWidth: 4, 
						steps: false, 
						fillColor: { colors: [{opacity: 0.25}, {opacity: 0}] } 
					},
					points: { 
						show: true, 
						radius: 4, 
						fill: true
					}
				}, 
				tooltip: true, 
				tooltipOpts: {
					content: '%s: %y'
				}, 
				xaxis: { mode: "time" }, 
				grid: { borderWidth: 0, hoverable: true }
			};
			
			
			
			var  dt2 = [], st = new Date(2015, 2, 12).getTime();
			
			for( var i = 0; i < d2.length; i++ )
			{
					//alert("st total :"+obj.barChatData[i].date_time);
				dt2.push([st + i * 3600000, parseFloat( (d2[i]).toFixed( 3 ) )]);
			}
			
			var data = [
				{ data: dt2, color: '#f36a30',
					label: 'Missed Call',
					points: { show: false },
					lines: { lineWidth: 2,
						fill: false } }
			];
			
			$.plot( target, data, options );
			
		}, 
		
		pieChart: function( target ,response) {
			obj = JSON.parse(response.trim());
			//alert("response "+response);//pieChart
			var data = [
						{ label: ""+obj.pieChart[0].operator+"", data: obj.pieChart[0].count, color: "#CC0099" }, 
						{ label: ""+obj.pieChart[1].operator+"", data: obj.pieChart[1].count, color: "#0066CC" }, 
						{ label: ""+obj.pieChart[2].operator+"", data: obj.pieChart[2].count, color: "#FF6600" }, 
						{ label: ""+obj.pieChart[3].operator+"", data: obj.pieChart[3].count, color: "#CC0000" }, 
						{ label: ""+obj.pieChart[4].operator+"", data: obj.pieChart[4].count, color: "#669933" }, 
						{ label: ""+obj.pieChart[5].operator+"", data: obj.pieChart[5].count, color: "#e18876" }
						
					], 
			id = target.parents('.tab-pane').attr('id');
			
			var opts = {
				series: {
					pie: {
						show: true,  
						innerRadius: 0.4, 
						offset: {
							left: 0
						}, 
						stroke: {
							width: 4
						}, label: {
	                        show: true,
	                        radius: 1,
	                        formatter: function (label, series) {
	                            return '<div style="font-size:8pt;text-align:center;padding:2px;color:' + series.color + '">' + label + '<br/>' + series.percent.toFixed(2) + '%' + '<br/>' + series.data[0][1] + '</div>';
	                        },
	                        background: {
	                            color: null,
	                            opacity: 0
	                        }
	                    }
					}
				}, 
				legend: {
					position: 'sw',
					backgroundOpacity: 0
				}, 
				grid: {
					hoverable: true
				}
			};
			
			$.plot(target, data, opts);
		}, 
		
		barChart: function( target, hor ) {

				//Display horizontal graph
				var d1 = [];
				for (var i = 0; i <= 4; i += 1) {
					if(!hor)
						d1.push([i, parseInt(Math.random() * 80) + 20]);
					else
						d1.push([parseInt(Math.random() * 80) + 20, i]);
				}
			
				var d2 = [];
				for (var i = 0; i <= 4; i += 1) {
					if(!hor)
						d2.push([i, parseInt(Math.random() * 80) + 20]);
					else
						d2.push([parseInt(Math.random() * 80) + 20, i]);
				}
			
				var d3 = [];
				for (var i = 0; i <= 4; i += 1) {
					if(!hor)
						d3.push([i, parseInt(Math.random() * 80) + 20]);
					else
						d3.push([parseInt(Math.random() * 80) + 20, i]);
				}
							
				var data = [];
				data.push({
					data: d1, 
					label: 'Cars', 
					bars: {
						barWidth: 0.15, 
						order: 1, 
						fillColor: '#115b74'
					}
				});
				data.push({
					data: d2, 
					label: 'Helicopters', 
					bars: {
						barWidth: 0.15, 
						order: 2, 
						fillColor: '#e49600'
					}
				});
				data.push({
					data: d3, 
					label: 'Scooters', 
					bars: {
						barWidth: 0.15, 
						order: 3, 
						fillColor: '#86c5da'
					}
				});
				
				var options = {
					grid: {
						hoverable: true, 
						borderWidth: 0
					}, 
					bars: {
						horizontal: hor, 
						show: true, 
						align: 'center', 
						lineWidth: 0
					}, 
					legend: {
						show: false
					}, 
					tooltip: true
				};
			
			$.plot( target, data, options );
			
		}, 

		lineChartsWithB: function( target ) {
			var goals = [],
				actuals = [];
			
			for( var i = 0; i < 10; i++ ) {
				var goal = Math.floor( 2400 + Math.random() * 600 ),	
					t = new Date(2011, i, 01).getTime() + (24 * 60 * 60 * 1000);
				
				goal = Math.ceil(goal / 10) * 10;
				goals.push([t, goal]);
				actuals.push([t, Math.floor(goal - (i * 15) + Math.random() * (i * 30))]);
			}
			
			var data = [
				{
					data: goals, 
					label: "Target Revenue", 
					color: '#08c', 
					bars: { 
						show: true, 
						barWidth: 10 * 24 * 60 * 60 * 1000, 
						align: "center"
					}
				}, {
					data: actuals, 
					label: "Actual Revenue", 
					color: '#CC2B36', 
					lines: {
						show: true 
					}, 
					points: {
						show: true, 
						radius: 4
					}
				}
			], 
			options = {
				xaxis: {
					mode: 'time'
				}, 
				tooltip: true, 
				tooltipOpts: {
					content: '%x - %y', 
					dateFormat: '%b %y'
				}, 
				grid: {
					borderWidth: 0, 
					hoverable: true 
				}
			};

			$.plot(target, data, options);
		}, 

		updating: function( target ) {
			// we use an inline data source in the example, usually data would
			// be fetched from a server
			var data = [], totalPoints = 200;

			function getRandomData() {
				if (data.length > 0)
					data = data.slice(1);

				// do a random walk
				while (data.length < totalPoints) {
					var prev = data.length > 0 ? data[data.length - 1] : 50;
					var y = prev + Math.random() * 10 - 5;
					if (y < 0)
					y = 0;
					if (y > 100)
					y = 100;
					data.push(y);
				}

				// zip the generated y values with the x values
				var res = [];
				for (var i = 0; i < data.length; ++i)
				res.push([i, data[i]])
				return res;
			}

			// setup plot
			var options = {
				yaxis: { min: 0, max: 100 },
				xaxis: { min: 0, max: 100 },
				colors: ["#26b"],
				series: {
					lines: { 
						lineWidth: 2, 
						fill: true,
						fillColor: { colors: [ { opacity: 0.4 }, { opacity: 0 } ] },
						steps: false
					}
				}, 
				grid: {
					borderWidth: 0
				}
			};

			var plot = $.plot(target, [ getRandomData() ], options);

			function update() {
				plot.setData([ getRandomData() ]);
				// since the axes don't change, we don't need to call plot.setupGrid()
				plot.draw();

				setTimeout(update, 500);
			}

			update();
		}
		
	};
	
	$(window).load(function() { });
	
	$(document).ready(function() {	
		

			demos.lineCharts( $('#demo-charts-01') );
			
			if($.plot) {

	            $.ajax({
	                url: "DashboardController.jsp?action=getPieChartObdData"
	            }).done(function (response) {
	                    alert("*******response.length***07*******:"+response);
	            	demos.pieChart( $('#piechartObd_07'), response);
	            	
	                });
	           /* $.ajax({
	                url: "DashboardController.jsp?action=getPieChartData7"
	            }).done(function (response) {
	                   alert("*******response.length chat 7**********:"+response);
	            	demos.pieChart( $('#demo-charts-07'), response);
	            	
	                });*/

	           /* $.ajax({
	                url: "DashboardController.jsp?action=getBarChartData"
	            }).done(function (response) {
	                  //  alert("*******response.length**********:"+response);
	            	demos.lineCharts( $('#demo-charts-01'), response);
	                });*/

	           	}
		
			
			
			
	});
	
	
}) (jQuery, window, document);

