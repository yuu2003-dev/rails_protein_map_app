# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "sessions"
  }

  devise_scope :user do
    post "users/guest_sign_in", to: "sessions#guest_sign_in", as: :guest_sign_in
  end

  root "shops#index"

  get "mypage", to: "users#mypage", as: :mypage

  resources :users, only: %i[edit update]

  resources :shops do
    member do
      post "favorite", to: "favorites#create", as: :favorite
      delete "unfavorite", to: "favorites#destroy", as: :unfavorite
    end
    resources :menus
  end
end
