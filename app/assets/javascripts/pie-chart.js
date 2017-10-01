$(document).ready(function(){
  $("#pie-form").on("submit",function(event){
    event.preventDefault();
    console.log("bound")
    var $form = $(this)
    console.log($form.attr("method"))
  $request = $.ajax({
    url: $form.attr("url"),
    data: $form.serialize(),
    method: $form.attr("method")
  })
  $request.done(function(serverResponse){
    $("#chart").empty();
    renderPieChart(serverResponse)
    // renderC3Chart();
    renderDownloadButton();
  })
  })
});



var renderPieChart = function(dataset){
  console.log('AHHHHHHHH');
  var width = 600;
  var height = 600;
  var radius = Math.min(width, height) / 2;

  var color = d3.scaleOrdinal(d3.schemeCategory20b);

  var svg = d3.select('#chart')
  .append('svg')
  .attr('width', width)
  .attr('height', height)
  .attr('id', "d3-chart")
  .append('g')
  .attr('transform', 'translate(' + (width / 2 ) + ',' + (height / 2) + ')');

  var arc = d3.arc()
  .innerRadius(0)
  .outerRadius(radius);

  var pie = d3.pie()
  .value(function(d) { return d.amount; })
  .sort(null);

  var path = svg.selectAll('path')
  .data(pie(dataset))
  .enter()
  .append('path')
  .attr('d', arc)
  .attr('fill', function(d) {
    return color(d.data.label);
})

  var arcs = svg.selectAll("g.slice")
  .enter()
  .append("svg:g")
  .attr("class", "slice");

  arcs.append("svg:text")
      .attr("transform", function(d){
        d.innerRadius = 0;
        d.outerRadius = r;
        return "translate(" + arc.centroid(d) + ")";
      })
      .attr("text-anchor", "middle")
      .text(function(d, i) { return dataset[i].label; });
}

var renderDownloadButton = function(){
  $("#download-div").removeClass("hidden");
  downloadHandler();
}

var downloadHandler = function(){
  $("#download-form").on("submit", function(event){
    event.preventDefault();
    console.log("bound")
    saveSvgAsPng(document.getElementById("d3-chart"), "chartable-diagram.png")
  })
}




