HTMLWidgets.widget({
  name: 'd3plusbar',

  type: 'output',
  
  factory: function(el, width, height){
    var d3plus_viz = d3plus.viz()
    .container("#" + el.id);
    return{
      renderValue: function(x){
        
        var data = HTMLWidgets.dataframeToD3(x.data);
        var axisx = x.settings.x;
        var axisy = x.settings.y;
        var id = x.settings.id;
        var xlabel = x.settings.xlabel;
        var ylabel = x.settings.ylabel;
        var title = x.settings.title;
        var digits = x.settings.digits;
        var xtime = x.settings.xtime;
        var attributes = x.attributes;
        var legend = x.settings.legend;
        var tooltip_vars = x.settings.tooltip;
        var gridx = x.settings.gridx;
        var gridy = x.settings.gridy;
        var filters = x.settings.filters;
        var background_color = x.settings.background_color;
        var width_panel = x.settings.width_panel;
        var stackedy = x.settings.stackedy;
        var stackedx = x.settings.stackedx;
        var scaley = x.settings.scaley;
        var scalex = x.settings.scalex;
        var legend_data = x.settings.legend_data;
        var legend_size = x.settings.legend_size;  
        var currency = x.settings.currency;
        var number_text = x.settings.number_text;
        var currency_var = x.settings.currency_var;
        var percent_var = x.settings.percent_var;
        var depth = 0;
        var locale = x.settings.locale;
        var dictionary = x.settings.dictionary;
        var newId = el.id;

        d3plus_viz
        .data(data)
        .type("bar")
        .id(id)
        .y({
            "value": axisy,
            "scale": scaley,
            "label": ylabel,
            "grid": gridy,
            "stacked": stackedy[0],
            "persist": {"position": true, "size": true}
        })
        .x({
            "value": axisx,
            "label": xlabel,
            "grid": gridx,
            "stacked": stackedx[0],
            //"persist": {"position": true},
            "scale": scalex
        })
        .tooltip(tooltip_vars)
        .title(title)
        .format({"locale": locale})
        .time({"value": xtime})
        .resize(true)
        .axes({"background": {
            "color": "#FFFFFF",
            "stroke": {"width": width_panel}
            }
        })
        .legend({
            "value": legend,
            "data": legend_data,
            "size": legend_size,
            "filters": filters,
            "order": {
                "sort": "asc",
                "value": "id"
                }
        });
        
        if(scalex === 'discrete'){
          d3plus_viz.order({"value": axisx, "sort": "asc"});
        } else {
          d3plus_viz.order({"value": axisy, "sort": "desc"});
        }
        if(currency_var === null){
          currency_var = [];
        }
        
        if(percent_var === null){
          percent_var = [];
        }
        
          d3plus_viz
          .format({"number": function(number, params){
            if (currency_var.indexOf(params.key) > - 1) {
              if (Math.abs(number) >= 2e9){
                return currency + " " + d3plus.number.format(number/1e9, params) + " "  + number_text[4];
              }
              else if(Math.abs(number) >= 1e9){
                return currency + " "  + d3plus.number.format(number/1e9, params) + " "  + number_text[3];  
              }
              else if (Math.abs(number) >= 2e6){
                return currency + " "  + d3plus.number.format(number/1e6, params) + " "  + number_text[2];  
              }
              else if(Math.abs(number) >= 1e6){
                return currency + " "  + d3plus.number.format(number/1e6, params) + " "  + number_text[1];  
              }
              else if(Math.abs(number) >= 1e3){
                return currency + " "  + d3plus.number.format(number/1e3, params) + " "  + number_text[0];  
              }
              else {
                return currency + " "  + number;  
              }
            } else if(percent_var.indexOf(params.key) > - 1){
              return d3plus.number.format(number, params) + "%";
            } else {
              return d3plus.number.format(number, params);
            }
          }});
          
        if(dictionary){
          d3plus_viz
          .format({"text": function(text) {
            if (dictionary[text]) {
              return dictionary[text];
            }
            else {
              return text;
            }
          }
        });
        }
        
        console.log(attributes[id[0]][0].hex);
        
        if(attributes){
            d3plus_viz
            .depth(0, function(d) {
                d3plus_viz
                .y({"stacked": stackedy[d]})
                .x({"stacked": stackedx[d]});
                });
            d3plus_viz.attrs(attributes);
            if(attributes[id[0]][0].hex){
                d3plus_viz
                .color("hex");
            }
            if(attributes[id[0]][0].icon){
                d3plus_viz
                .icon({"value": "icon", "style": "knockout"});
            }
        } else {
            d3plus_viz
            .color(id[0])
            .depth(0, function(d) {
                d3plus_viz
                .color(id[d])
                .y({"stacked": stackedy[d]})
                .x({"stacked": stackedx[d]});
                });
        }


        if(document.getElementById("htmlwidget_container")){
          d3plus_viz.draw();
        }
        else{
            var active = $(el).closest('div.tab-pane.active');
            var tab = $(el).closest('div.tab-pane');
            var dashboard = document.getElementById("dashboard-container");
    
            if(active[0]){
                d3plus_viz.draw();
            }
            else if(tab[0]){
              var tabID = tab.attr('id');
              var tabAnchor = $('a[data-toggle="tab"][href="#' + tabID + '"]');
              if (tabAnchor !== null){
                 tabAnchor.on('shown.bs.tab', function() {
                   var height, width;
                  if(dashboard !== null){
                    height = $(el).closest('div.chart-shim').innerHeight();
                    width = $(el).closest('div.chart-shim').innerWidth();
                  }
                  else{
                    height = $(el).closest('div.html-widget.html-widget-static-bound').innerHeight();
                    width = $(el).closest('div.html-widget.html-widget-static-bound').innerWidth();
                  }
                  d3plus_viz
                  .height(height)
                  .width(width);
                  d3plus_viz.draw();
                });
              }
            }
            else{
                d3plus_viz.draw();
            }
          }
      },
      
      resize: function(width, height){
        
      },
      
      viz: d3plus_viz
    };
  }
});