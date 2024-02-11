# frozen_string_literal: true

Rails.application.routes.draw do
  get '/:token' => 'redirects#show'

  get 'up' => 'rails/health#show', as: :rails_health_check

  namespace :api, path: 'api/v1', defaults: { format: :json } do
    resources :links do
      resources :analytics, only: :index
    end
  end
end
