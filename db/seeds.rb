# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_shortcode
  rand(36**10).to_s(36)
end

# create 20 generic QR Codes
(1..20).each{ QRCode.create :shortcode => create_shortcode }

# create some specific QR Codes and corresponding badges
code = QRCode.create :shortcode => create_shortcode
Badge.create :slug => '3d-printer', :title => '3D Printer', :qr_code_id => code.id

code = QRCode.create :shortcode => create_shortcode
Badge.create :slug => 'oscilloscope', :title => 'Oscilloscope', :qr_code_id => code.id

code = QRCode.create :shortcode => create_shortcode
Badge.create :slug => 'soldering-station', :title => 'Soldering Station', :qr_code_id => code.id

code = QRCode.create :shortcode => create_shortcode
Badge.create :slug => 'led-light-strips', :title => 'LED Light Strips', :qr_code_id => code.id

code = QRCode.create :shortcode => create_shortcode
Badge.create :slug => 'event-calendar', :title => 'Event Calendar', :qr_code_id => code.id

# create some special-case badges
Badge.create :slug => '3-members', :title => 'Found Three Members'
Badge.create :slug => '6-members', :title => 'Found Six Members'
Badge.create :slug => '5-qrcodes', :title => 'Found Five QR Codes'
Badge.create :slug => '10-qrcodes', :title => 'Found Ten QR Codes'
Badge.create :slug => '15-qrcodes', :title => 'Found Fifteen QR Codes'
Badge.create :slug => '20-qrcodes', :title => 'Found Twenty QR Codes'
Badge.create :slug => '25-qrcodes', :title => 'Found Twenty Five QR Codes'
Badge.create :slug => '3-correct-questions', :title => 'Answered Three Questions Correctly'
Badge.create :slug => '6-correct-questions', :title => 'Answered Six Questions Correctly'
Badge.create :slug => '8-correct-questions', :title => 'Answered Eight Questions Correctly'