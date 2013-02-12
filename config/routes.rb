HicapQrContest::Application.routes.draw do
  root :to => 'game#leaderboard'
  
  get ':shortcode' => 'qrcode#show', :constraints => {:shortcode => /[A-Za-z0-9]{10}/}
  
  resources :users, :except => [:index, :show, :destroy]
  resources :badges, :except => [:new, :create, :edit, :update, :destroy]
end
