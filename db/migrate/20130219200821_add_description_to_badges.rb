class AddDescriptionToBadges < ActiveRecord::Migration
  def up
    add_column :badges, :description, :string, :limit => 255
    
    Badge.find_by_slug('3d-printer').update_attributes(:description => '3D Printers make tangible objects using plastic. Have a neat project idea? HI Capacity has 3D printers available for members to use!')
    Badge.find_by_slug('oscilloscope').update_attributes(:description => 'Having some trouble with your electronics project? An oscilloscope is an invaluable tool for testing. Stop by HI Capacity and try one out!')
    Badge.find_by_slug('soldering-station').update_attributes(:description => 'Working on a cool electronics project? HI Capacity has all of the tools you need to solder and test your boards!')
    Badge.find_by_slug('led-light-strips').update_attributes(:description => 'HI Capacity can help you add some color to your next project.')
    Badge.find_by_slug('event-calendar').update_attributes(:description => 'Never a dull moment at HI Capacity! Learn about new technology, collaborate on exciting projects, or relax at a beach BBQ.')
    Badge.find_by_slug('3-members').update_attributes(:description => 'Meet some cool members at HI Capacity.')
    Badge.find_by_slug('6-members').update_attributes(:description => 'Meet some cool members at HI Capacity.')
    Badge.find_by_slug('5-qrcodes').update_attributes(:description => "You've found 5 hidden codes!")
    Badge.find_by_slug('10-qrcodes').update_attributes(:description => "You've found 10 hidden codes!")
    Badge.find_by_slug('15-qrcodes').update_attributes(:description => "You've found 15 hidden codes!")
    Badge.find_by_slug('20-qrcodes').update_attributes(:description => "You've found 20 hidden codes!")
    Badge.find_by_slug('25-qrcodes').update_attributes(:description => "You've found 25 hidden codes!")
    Badge.find_by_slug('3-correct-questions').update_attributes(:description => "You've answered 3 of our trivia questions correctly!")
    Badge.find_by_slug('6-correct-questions').update_attributes(:description => "You've answered 6 of our trivia questions correctly!")
    Badge.find_by_slug('8-correct-questions').update_attributes(:description => "You've answered 8 of our trivia questions correctly!")
    
    change_column :badges, :description, :string, :limit => 255, :null => false
  end
  
  def down
    remove_column :badges, :description
  end
end
