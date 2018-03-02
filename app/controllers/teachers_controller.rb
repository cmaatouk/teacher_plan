class TeachersController < ApplicationController
  def index
    @teachers = Teacher.page(params[:page]).per(10)
  end

  def show
    @teacher = Teacher.find(params[:id])
  end
end
