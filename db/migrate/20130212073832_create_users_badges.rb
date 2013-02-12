class CreateUsersBadges < ActiveRecord::Migration
  def change
    create_table :users_badges, :id => false do |t|
      t.references :user, :null => false
      t.references :badge, :null => false
    end
    
    add_index :users_badges, :user_id
  end
end
