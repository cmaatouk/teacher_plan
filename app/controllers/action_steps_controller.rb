class ActionStepsController < ApplicationController
  def index
    @action_steps = ActionStep.all

    render("action_steps/index.html.erb")
  end

  def show
    @action_step = ActionStep.find(params[:id])

    render("action_steps/show.html.erb")
  end

  def new
    @action_step = ActionStep.new

    render("action_steps/new.html.erb")
  end

  def create
    @action_step = ActionStep.new

    @action_step.descriptions = params[:descriptions]
    @action_step.target_dates = params[:target_dates]
    @action_step.leader = params[:leader]
    @action_step.necessary_resources = params[:necessary_resources]
    @action_step.implementation_specifics = params[:implementation_specifics]
    @action_step.measure_of_success = params[:measure_of_success]
    @action_step.goal_id = params[:goal_id]

    save_status = @action_step.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/action_steps/new", "/create_action_step"
        redirect_to("/action_steps")
      else
        redirect_back(:fallback_location => "/", :notice => "Action step created successfully.")
      end
    else
      render("action_steps/new.html.erb")
    end
  end

  def edit
    @action_step = ActionStep.find(params[:id])

    render("action_steps/edit.html.erb")
  end

  def update
    @action_step = ActionStep.find(params[:id])

    @action_step.descriptions = params[:descriptions]
    @action_step.target_dates = params[:target_dates]
    @action_step.leader = params[:leader]
    @action_step.necessary_resources = params[:necessary_resources]
    @action_step.implementation_specifics = params[:implementation_specifics]
    @action_step.measure_of_success = params[:measure_of_success]
    @action_step.goal_id = params[:goal_id]

    save_status = @action_step.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/action_steps/#{@action_step.id}/edit", "/update_action_step"
        redirect_to("/action_steps/#{@action_step.id}", :notice => "Action step updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Action step updated successfully.")
      end
    else
      render("action_steps/edit.html.erb")
    end
  end

  def destroy
    @action_step = ActionStep.find(params[:id])

    @action_step.destroy

    if URI(request.referer).path == "/action_steps/#{@action_step.id}"
      redirect_to("/", :notice => "Action step deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Action step deleted.")
    end
  end
end
