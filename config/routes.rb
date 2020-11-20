Rails.application.routes.draw do
  get 'array/input'
  get 'array/view'
  root 'array#input.html.erb'
end
