HicapQrContest::Application.routes.draw do
  root :to => 'game#leaderboard'
  
  get ':shortcode' => 'qrcode#show', :constraints => {:shortcode => /[A-Za-z0-9]{6}/}
  
  resources :users
end
