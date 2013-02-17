HicapQrContest::Application.routes.draw do
  root :to => 'game#leaderboard'
  
  get ':shortcode' => 'qrcode#show', :constraints => {:shortcode => /[A-Za-z0-9]{10}/}
  
  resources :sessions, :except => [:index, :show, :new, :edit, :update]
  resources :users, :except => [:index, :show, :destroy]
  resources :badges, :except => [:new, :create, :edit, :update, :destroy]
  
  scope :module => :api, :path => 'api/v:version', :as => :api do
    controller :leaderboard, :path => :leaderboard, :as => :leaderboard do
      get '', :action => :index, :anchor => true
    end
  end
end
