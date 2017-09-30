//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require d3

var bardata = [20,30,45,15];
var height = 400,
    width = 600,
    barWidth = 50,
    barOffset = 5;

d3.select("#test").append('svg')
  .attr('width', width)
  .attr('height', height);
  .style('background', '#C9D7D6')
.selectAll('rect').data(bardata)
  .enter().append('rect')
    .style('fill','#C61C6F')
    .attr('width', barWidth)
    .attr('height', function(d){})

