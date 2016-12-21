Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :topics do
        member do
            post :upvote
            post :devote
        end
    end
    root 'topics#index'
end
