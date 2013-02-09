class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, :id => false do |t|
      t.primary_key :fbid
      t.string      :username, :limit => 255, :null => false
      t.boolean     :use_profile_pic, :default => true, :null => false
      t.timestamps
    end
  end
end
