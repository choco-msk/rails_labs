Rails.application.routes.draw do
  get 'input/input'
  get 'input/view'
  root 'input#input.html.erb'
end
