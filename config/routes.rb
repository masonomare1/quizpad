Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      shallow do
        resources :quizzes do
          resources :questions do
            resources :options
          end

          resources :quiz_attempts, only: %i[index create show] do
            post '/question/:id/solve', action: :solve, as: :solve
          end
        end
      end
    end
  end
end
