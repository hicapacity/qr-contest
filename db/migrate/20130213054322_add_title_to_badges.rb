class AddTitleToBadges < ActiveRecord::Migration
  def up
    add_column :badges, :title, :string, :limit => 100
    change_column :badges, :title, :string, :limit => 100, :null => false
  end
  
  def down
    remove_column :badges, :title
  end
end
