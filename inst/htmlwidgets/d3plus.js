HTMLWidgets.widget({

  name: 'd3plus',

  type: 'output',

  factory: function(el, width, height) {
     
     var d3plus_viz = d3plus.viz()
     .container("#" + el.id);
     
     return{
      renderValue: function(x){
        
        var data = HTMLWidgets.dataframeToD3(x.data);
        var type = x.settings.type;
        var id = x.settings.id;
        var title = x.settings.title;
        var currency = x.settings.currency;
        var number_text = x.settings.number_text;
        var currency_var = x.settings.currency_var;
        var percent_var = x.settings.percent_var;
        var locale = x.settings.locale;
        var dictionary = x.settings.dictionary;
        var newId = el.id;

        d3plus_viz
        .data(data)
        .type(type)
        .id(id)
        .title(title)
        .resize(true)
        .format({"locale": locale})
        .legend({"filters": true});
        
        if(x.d3plusAxisX){
          d3plus_viz
          .x(x.d3plusAxisX);
        }
        
        if(x.d3plusAxisY){
          d3plus_viz
          .y(x.d3plusAxisY);
        }
        
        if(x.d3plusAttributes){
          d3plus_viz
          .attrs(x.d3plusAttributes);
        }
        
        if(x.d3plusColor){
          d3plus_viz
          .color(x.d3plusColor);
        }
        
        if(x.d3plusIcon){
          d3plus_viz
          .icon(x.d3plusIcon);
        }
        
         if(x.d3plusTooltip){
          d3plus_viz
          .tooltip(x.d3plusTooltip);
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