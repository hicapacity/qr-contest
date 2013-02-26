#def create_shortcode
#  rand(36**10).to_s(36)
#end

# create 20 generic QR Codes
[ 'iefam55i63',
  'iefam55i63',
  '4vxp6re21p',
  'nqgnmh7o6v',
  '32s19aa1dm',
  'c457z8pjpg',
  '8sf3fn9e6w',
  'bzzaxqlxsd',
  'tin2unixbg',
  'ccfv1yiu5r',
  'lmapoqg1wg',
  'jf2m04cn9i',
  '3gsc5tv15a',
  'xum2konbub',
  'm6da8jxgpn',
  'nbyyit8egj',
  'bf4am4rshc',
  '3qn8s7hy0a',
  'r6wg4i54g6' ].each{ |code| QRCode.create :shortcode => code }

# member codes
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