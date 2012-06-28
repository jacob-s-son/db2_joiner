class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :node1_type
      t.string :node2_type
      t.integer :node1_id
      t.integer :node2_id

      t.timestamps
    end
    
    add_index :links, [:node1_type, :node1_id], :name => "link_1st_node_idx"
    add_index :links, [:node2_type, :node2_id], :name => "link_2nd_node_idx"
  end
end
