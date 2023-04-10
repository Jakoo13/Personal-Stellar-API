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

  #  Get all work orders for a specific user
  get 'users/:id/work-orders' => 'users#work_orders'

  # Mark work order en-route
  put 'work-orders/:id/en-route' => 'work_orders#en_route'

  # Accept or Decline a work order
  put 'work-orders/:id/:acceptOrDecline' => 'work_orders#accept_or_decline'

  # Assign a work order to a user
  put 'work-orders/:id/assign/:user_id' => 'work_orders#assign'

  # Mark first time login as false
  put 'users/:id/first-time-login' => 'users#first_time_login'

end
