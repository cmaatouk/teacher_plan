class ApplicationController < ActionController::Base
  before_action :authenticate_teacher!

  protect_from_forgery with: :exception
end
