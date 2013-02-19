class AddRankToBadges < ActiveRecord::Migration
  def up
    add_column :badges, :rank, :integer, :default => 0, :null => false
    
    Badge.find_by_slug('3d-printer').update_attributes(:rank => 7)
    Badge.find_by_slug('oscilloscope').update_attributes(:rank => 7)
    Badge.find_by_slug('soldering-station').update_attributes(:rank => 7)
    Badge.find_by_slug('led-light-strips').update_attributes(:rank => 5)
    Badge.find_by_slug('event-calendar').update_attributes(:rank => 6)
    Badge.find_by_slug('3-members').update_attributes(:rank => 2)
    Badge.find_by_slug('6-members').update_attributes(:rank => 4)
    Badge.find_by_slug('5-qrcodes').update_attributes(:rank => 0)
    Badge.find_by_slug('10-qrcodes').update_attributes(:rank => 1)
    Badge.find_by_slug('15-qrcodes').update_attributes(:rank => 2)
    Badge.find_by_slug('20-qrcodes').update_attributes(:rank => 3)
    Badge.find_by_slug('25-qrcodes').update_attributes(:rank => 4)
    Badge.find_by_slug('3-correct-questions').update_attributes(:rank => 1)
    Badge.find_by_slug('6-correct-questions').update_attributes(:rank => 2)
    Badge.find_by_slug('8-correct-questions').update_attributes(:rank => 4)
  end
  
  def down
    remove_column :badges, :rank
  end
end
