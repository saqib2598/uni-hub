# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'dashboards#index'
  get 'about' => 'dashboard#about', as: 'about'
  get 'contact' => 'dashboard#contact', as: 'contact'

  resources :universities, only: [:show]
  resources :unihub_applications

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
