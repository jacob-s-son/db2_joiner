module LinkableModel
  
  def self.included(base)
    # base.include InstanceMethods

    base.class_eval do
      has_many :links, :finder_sql => proc {  "SELECT * FROM links l WHERE ( l.node1_type = '#{self.class.name}' AND l.node1_id = #{id} )  " + 
                                              "OR ( l.node2_type = '#{self.class.name}' AND l.node2_id = #{id} ) " }

      ActiveRecord::Base.connection.tables.each do |tbl|
        next if tbl == base.table_name || tbl == "links"
        has_many  :"linked_#{tbl}", 
                  :finder_sql => proc { " SELECT tbl.* FROM links l, #{tbl} tbl WHERE " +
                                        "( l.node1_type = '#{self.class.name}' AND l.node1_id = #{id} AND l.node2_type = '#{tbl.singularize.camelize}' AND l.node2_id = tbl.id )" + 
                                        "OR ( l.node2_type = '#{self.class.name}' AND l.node2_id = #{id} AND l.node1_type = '#{tbl.singularize.camelize}' AND l.node1_id = tbl.id ) " },
                  :class_name => tbl.singularize.camelize
      end
    end
  end

  def link linkable
    Link.create({:node1_type => self.class.to_s, :node1_id => id, :node2_id => linkable.id, :node2_type => linkable.class.to_s})
  end
end