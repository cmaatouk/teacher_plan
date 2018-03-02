class CoachingPositionsController < ApplicationController
  def index
    @coaching_positions = CoachingPosition.all

    render("coaching_positions/index.html.erb")
  end

  def show
    @coaching_position = CoachingPosition.find(params[:id])

    render("coaching_positions/show.html.erb")
  end

  def new
    @coaching_position = CoachingPosition.new

    render("coaching_positions/new.html.erb")
  end

  def create
    @coaching_position = CoachingPosition.new

    @coaching_position.user_id = params[:user_id]
    @coaching_position.improvement_plan_id = params[:improvement_plan_id]

    save_status = @coaching_position.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/coaching_positions/new", "/create_coaching_position"
        redirect_to("/coaching_positions")
      else
        redirect_back(:fallback_location => "/", :notice => "Coaching position created successfully.")
      end
    else
      render("coaching_positions/new.html.erb")
    end
  end

  def edit
    @coaching_position = CoachingPosition.find(params[:id])

    render("coaching_positions/edit.html.erb")
  end

  def update
    @coaching_position = CoachingPosition.find(params[:id])

    @coaching_position.user_id = params[:user_id]
    @coaching_position.improvement_plan_id = params[:improvement_plan_id]

    save_status = @coaching_position.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/coaching_positions/#{@coaching_position.id}/edit", "/update_coaching_position"
        redirect_to("/coaching_positions/#{@coaching_position.id}", :notice => "Coaching position updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Coaching position updated successfully.")
      end
    else
      render("coaching_positions/edit.html.erb")
    end
  end

  def destroy
    @coaching_position = CoachingPosition.find(params[:id])

    @coaching_position.destroy

    if URI(request.referer).path == "/coaching_positions/#{@coaching_position.id}"
      redirect_to("/", :notice => "Coaching position deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Coaching position deleted.")
    end
  end
end
