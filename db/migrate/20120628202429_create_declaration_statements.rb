class CreateDeclarationStatements < ActiveRecord::Migration
  def change
    create_table :declaration_statements do |t|

      t.timestamps
    end
  end
end
