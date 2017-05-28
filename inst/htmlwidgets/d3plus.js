HTMLWidgets.widget({

  name: 'd3plus',

  type: 'output',

  factory: function(el, width, height) {
     
     var d3plus_viz = d3plus.viz()
     .container("#" + el.id);
     
     return{
      renderValue: function(x){
        
        var data = x.data;
        var type = x.settings.type;
        var id = x.settings.id;
        var currency = x.settings.currency;
        var number_text = x.settings.number_text;
        var currency_var = x.settings.currency_var;
        var percent_var = x.settings.percent_var;
        var noformat_number_var = x.settings.noformat_number_var;
        var d3plus_number_format = x.settings.d3plus_number_format;
        var locale = x.settings.locale;
        var dictionary = x.settings.dictionary;
        var newId = el.id;

        d3plus_viz
        .type(type)
        .resize(true)
        .format({"locale": locale})
        .legend({"filters": true});
        
        if(data){
          d3plus_viz
          .data(data);
        }
        
        if(x.d3plusData){
          d3plus_viz
          .data(x.d3plusData);
        }
        
        if(id){
          d3plus_viz
          .id(id);
        }
        
        if(x.d3plusId){
          d3plus_viz
          .id(x.d3plusId);
        }
        
        if(x.d3plusAxisX){
          d3plus_viz
          .x(x.d3plusAxisX);
        }
        
        if(x.d3plusAxisY){
          d3plus_viz
          .y(x.d3plusAxisY);
        }
        
        if(x.d3plusSize){
          d3plus_viz
          .size(x.d3plusSize);
        }
        
        if(x.d3plusLegend){
          d3plus_viz
          .legend(x.d3plusLegend);
        }
        
        if(x.d3plusAttrs){
          d3plus_viz
          .attrs(x.d3plusAttrs);
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

        if(x.d3plusTime){
          d3plus_viz
          .time(x.d3plusTime);
        }


        if(x.d3plusDepth){
          d3plus_viz
          .depth(x.d3plusDepth);
        }

        if(x.d3plusLabels){
          d3plus_viz
          .labels(x.d3plusLabels);
        }
        
        if(x.d3plusCoords){
          d3plus_viz
          .coords(x.d3plusCoords);
        }
        
        if(x.d3plusText){
          d3plus_viz
          .text(x.d3plusText);
        }
        
        if(x.d3plusFooter){
          d3plus_viz
          .footer(x.d3plusFooter);
        }
        
        if(x.d3plusTitle){
          d3plus_viz
          .title(x.d3plusTitle);
        }
        
        if(x.d3plusNodes){
          d3plus_viz
          .nodes(x.d3plusNodes);
        }
        
        if(x.d3plusEdges){
          d3plus_viz
          .edges(x.d3plusEdges);
        }
        
        if(x.d3plusActive){
          d3plus_viz
          .active(x.d3plusActive);
        }
        
        if(x.d3plusAggs){
          d3plus_viz
          .aggs(x.d3plusAggs);
        }
        
        if(x.d3plusTotal){
          d3plus_viz
          .total(x.d3plusTotal);
        }
        
        if(x.d3plusAxes){
          d3plus_viz
          .axes(x.d3plusAxes);
        }

        if(x.d3plusCols){
          d3plus_viz
          .cols(x.d3plusCols);
        }
        
        if(x.d3plusZoom){
          d3plus_viz
          .zoom(x.d3plusZoom);
        }
        
        if(x.d3plusFocus){
          d3plus_viz
          .focus(x.d3plusFocus);
        }
        
        if(x.d3plusFont){
          d3plus_viz
          .font(x.d3plusFont);
        }
        
        if(x.d3plusUi){
          d3plus_viz
          .ui(x.d3plusUi);
        }  
        
        if(currency_var === null){
          currency_var = [];
        }
        
        if(percent_var === null){
          percent_var = [];
        }
        
        if(noformat_number_var === null){
          noformat_number_var = [];
        }
        
        if(x.d3plusFormat){
          d3plus_viz
          .format(x.d3plusFormat);
        }
        
          d3plus_viz
          .format({"number": function(number, params){
            if (currency_var.indexOf(params.key) > - 1) {
              if (Math.abs(number) >= 2e9){
                formatter = d3.locale(params.locale.format);
                return currency + " " + formatter.numberFormat(",")(d3.round(number/1e9, 1)) + " "  + number_text[4];
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
                return currency + " "  + d3plus.number.format(number, params);  
              }
            } else if(percent_var.indexOf(params.key) > - 1){
              return d3plus.number.format(number, params) + "%";
            } else if(noformat_number_var.indexOf(params.key) > -1){
                return number;
            } else {
              if(d3plus_number_format){
                return d3plus.number.format(number, params);
              } else {
                formatter = d3.locale(params.locale.format);
                return formatter.numberFormat(",")(number);
              }
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
        
        setTimeout(function() {
        
          if(document.getElementById("htmlwidget_container")){
            d3plus_viz.draw();
          }
          else{
              var active = $(el).closest('div.tab-pane.active');
              var tab = $(el).closest('div.tab-pane');
              var dashboard = document.getElementById("dashboard-container");
              
              if(tab[0]){
                var tabID = tab.attr('id');
                var tabAnchor = $('a[data-toggle="tab"][href="#' + tabID + '"]');
                if (tabAnchor !== null){
                   if(active[0]){
                     d3plus_viz
                     .draw();
                   }
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
        }, 10);
      },
      
      resize: function(width, height){
        
      },
      
      viz: d3plus_viz
    };
  }
});