module ApplicationHelper
  def declaration_categories_data
    # "json_data" : {
    #          "data":[
    #              {
    #                  "data" : "Search engines",
    #                  "children" :[
    #                               {"data":"Yahoo"},
    #                               {"data":"Bing"},
    #                               {"data":"Google", "children":[{"data":"Youtube"},{"data":"Gmail"},{"data":"Orkut"}]}
    #                              ]
    #              },
    # 
    
    # "json_data": {
    #        //root elements to be displayed by default on the first load
    #      "data": [{"data":'Kit 1',"attr":{"id":'kit1'},"state" : "closed"},
    #               {"data":'Another node of level 1',"attr":{"id":'kit1'},"state" : "closed"}
    #              ],
    #     "ajax" : {
    #          url : "http://localhost/introspection/introspection/product",
    #          data : function(n) {
    #                   return {
    #                     "nodeid":$.trim(n.attr('id'))
    #                   }
    #                 }
    #      }
    #   }
    
    url = declaration_category_declaration_statements_url(:declaration_category_id => 1)
    
    <<-EOS
      { 
        "data":[
          #{ @categories.map {|c| 
              "{  \"data\": \"#{c.name}\", \"attributes\": { \"id\": \"#{c.id}\"}, \"children\": [ #{ subcategories_data(c) } ] }"
            }.join(',').html_safe 
          },
        ],
        ajax: {
          method: \"GET\",
          url: function(n) {
                    console.log(n);
                    return \"#{url}\".replace(/categories//[0-9]/, "/categories/" + $.trim(n.attr('id')) )
                  }
          } 
      }
    EOS
  end
  
  def subcategories_data category
    category.subcategories.sort.map do |sc|
      <<-EOS
        { 
          "data":   "#{sc.name}", 
          "state":  "closed",
          "attributes": { "id": \"#{sc.id}\" }
        }
      EOS
    end.join(',')
  end
end
