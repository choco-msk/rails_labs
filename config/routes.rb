Rails.application.routes.draw do
  get 'rafson/input'
  get 'rafson/view'
  get 'rafson/results'
  root 'rafson#input'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
