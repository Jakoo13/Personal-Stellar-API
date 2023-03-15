Rails.application.routes.draw do
  resources :work_orders
  resources :users, only: %i[index show]

  devise_for :users,
  path: '',
  path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'sessions',
    registrations: 'registration'
  }

end
