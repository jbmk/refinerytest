::Refinery::Application.routes.draw do
  resources :fieldtrips, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :fieldtrips, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
