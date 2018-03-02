Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "improvement_plans#index"
  # Routes for the Plan_comment resource:
  # CREATE
  get "/plan_comments/new", :controller => "plan_comments", :action => "new"
  post "/create_plan_comment", :controller => "plan_comments", :action => "create"

  # READ
  get "/plan_comments", :controller => "plan_comments", :action => "index"
  get "/plan_comments/:id", :controller => "plan_comments", :action => "show"

  # UPDATE
  get "/plan_comments/:id/edit", :controller => "plan_comments", :action => "edit"
  post "/update_plan_comment/:id", :controller => "plan_comments", :action => "update"

  # DELETE
  get "/delete_plan_comment/:id", :controller => "plan_comments", :action => "destroy"
  #------------------------------

  # Routes for the Coaching_position resource:
  # CREATE
  get "/coaching_positions/new", :controller => "coaching_positions", :action => "new"
  post "/create_coaching_position", :controller => "coaching_positions", :action => "create"

  # READ
  get "/coaching_positions", :controller => "coaching_positions", :action => "index"
  get "/coaching_positions/:id", :controller => "coaching_positions", :action => "show"

  # UPDATE
  get "/coaching_positions/:id/edit", :controller => "coaching_positions", :action => "edit"
  post "/update_coaching_position/:id", :controller => "coaching_positions", :action => "update"

  # DELETE
  get "/delete_coaching_position/:id", :controller => "coaching_positions", :action => "destroy"
  #------------------------------

  # Routes for the Comment resource:
  # CREATE
  get "/comments/new", :controller => "comments", :action => "new"
  post "/create_comment", :controller => "comments", :action => "create"

  # READ
  get "/comments", :controller => "comments", :action => "index"
  get "/comments/:id", :controller => "comments", :action => "show"

  # UPDATE
  get "/comments/:id/edit", :controller => "comments", :action => "edit"
  post "/update_comment/:id", :controller => "comments", :action => "update"

  # DELETE
  get "/delete_comment/:id", :controller => "comments", :action => "destroy"
  #------------------------------

  devise_for :teachers
  # Routes for the Teacher resource:
  # READ
  get "/teachers", :controller => "teachers", :action => "index"
  get "/teachers/:id", :controller => "teachers", :action => "show"


  # Routes for the Action_step resource:
  # CREATE
  get "/action_steps/new", :controller => "action_steps", :action => "new"
  post "/create_action_step", :controller => "action_steps", :action => "create"

  # READ
  get "/action_steps", :controller => "action_steps", :action => "index"
  get "/action_steps/:id", :controller => "action_steps", :action => "show"

  # UPDATE
  get "/action_steps/:id/edit", :controller => "action_steps", :action => "edit"
  post "/update_action_step/:id", :controller => "action_steps", :action => "update"

  # DELETE
  get "/delete_action_step/:id", :controller => "action_steps", :action => "destroy"
  #------------------------------

  # Routes for the Goal resource:
  # CREATE
  get "/goals/new", :controller => "goals", :action => "new"
  post "/create_goal", :controller => "goals", :action => "create"

  # READ
  get "/goals", :controller => "goals", :action => "index"
  get "/goals/:id", :controller => "goals", :action => "show"

  # UPDATE
  get "/goals/:id/edit", :controller => "goals", :action => "edit"
  post "/update_goal/:id", :controller => "goals", :action => "update"

  # DELETE
  get "/delete_goal/:id", :controller => "goals", :action => "destroy"
  #------------------------------

  # Routes for the Improvement_plan resource:
  # CREATE
  get "/improvement_plans/new", :controller => "improvement_plans", :action => "new"
  post "/create_improvement_plan", :controller => "improvement_plans", :action => "create"

  # READ
  get "/improvement_plans", :controller => "improvement_plans", :action => "index"
  get "/improvement_plans/:id", :controller => "improvement_plans", :action => "show"

  # UPDATE
  get "/improvement_plans/:id/edit", :controller => "improvement_plans", :action => "edit"
  post "/update_improvement_plan/:id", :controller => "improvement_plans", :action => "update"

  # DELETE
  get "/delete_improvement_plan/:id", :controller => "improvement_plans", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
