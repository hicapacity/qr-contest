class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :slug, :limit => 50, :null => false
      t.timestamps
    end
    
    add_index :badges, :slug
  end
end
