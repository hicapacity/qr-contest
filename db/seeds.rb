#def create_shortcode
#  rand(36**10).to_s(36)
#end

# create 20 generic QR Codes
[ 'iefam55i63',
  'h5jgtudsot',
  '4vxp6re21p',
  'nqgnmh7o6v',
  '32s19aa1dm',
  'c457z8pjpg',
  '8sf3fn9e6w',
  'bzzaxqlxsd',
  'tin2unixbg',
  'ccfv1yiu5r',
  'jf2m04cn9i',
  '3gsc5tv15a',
  'xum2konbub',
  'm6da8jxgpn' ].each{ |code| QRCode.create :shortcode => code }

# member codes
QRCode.create :shortcode => 'lmapoqg1wg', :is_member => true
QRCode.create :shortcode => 'nbyyit8egj', :is_member => true
QRCode.create :shortcode => 'bf4am4rshc', :is_member => true
QRCode.create :shortcode => '3qn8s7hy0a', :is_member => true
QRCode.create :shortcode => 'r6wg4i54g6', :is_member => true
QRCode.create :shortcode => '352fu4svgm', :is_member => true

# create some specific QR Codes and corresponding badges
code = QRCode.create :shortcode => 'twt9mm9kou'
Badge.create :slug => '3d-printer', :title => '3D Printer', :qr_code_id => code.id

code = QRCode.create :shortcode => '8thisqlis6'
Badge.create :slug => 'oscilloscope', :title => 'Oscilloscope', :qr_code_id => code.id

code = QRCode.create :shortcode => '9qnr45l6lv'
Badge.create :slug => 'soldering-station', :title => 'Soldering Station', :qr_code_id => code.id

code = QRCode.create :shortcode => '7lt6nsen5y'
Badge.create :slug => 'led-light-strips', :title => 'LED Light Strips', :qr_code_id => code.id

code = QRCode.create :shortcode => '7tf3gg04uw'
Badge.create :slug => 'event-calendar', :title => 'Event Calendar', :qr_code_id => code.id

code = QRCode.create :shortcode => 'jdivhtimzi'
Badge.create :slug => 'facebook', :title => 'Facebook Early Bird', :qr_code_id => code.id, :description => 'This badge was given to early participants who follow HI Capacity on Facebook.'

code = QRCode.create :shortcode => '4b8rxh6w7c'
Badge.create :slug => 'twitter', :title => 'Twitter Early Bird', :qr_code_id => code.id, :description => 'This badge was given to early participants who follow HI Capacity on Twitter.'

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