class ImprovementPlansController < ApplicationController
  def index
    @q = ImprovementPlan.ransack(params[:q])
    @improvement_plans = @q.result(:distinct => true).includes(:goals, :coaches, :plan_comments, :teacher, :users).page(params[:page]).per(10)

    render("improvement_plans/index.html.erb")
  end

  def show
    @plan_comment = PlanComment.new
    @coaching_position = CoachingPosition.new
    @goal = Goal.new
    @improvement_plan = ImprovementPlan.find(params[:id])

    render("improvement_plans/show.html.erb")
  end

  def new
    @improvement_plan = ImprovementPlan.new

    render("improvement_plans/new.html.erb")
  end

  def create
    @improvement_plan = ImprovementPlan.new

    @improvement_plan.teacher_id = params[:teacher_id]
    @improvement_plan.leader = params[:leader]
    @improvement_plan.action_state = params[:action_state]

    save_status = @improvement_plan.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/improvement_plans/new", "/create_improvement_plan"
        redirect_to("/improvement_plans")
      else
        redirect_back(:fallback_location => "/", :notice => "Improvement plan created successfully.")
      end
    else
      render("improvement_plans/new.html.erb")
    end
  end

  def edit
    @improvement_plan = ImprovementPlan.find(params[:id])

    render("improvement_plans/edit.html.erb")
  end

  def update
    @improvement_plan = ImprovementPlan.find(params[:id])

    @improvement_plan.teacher_id = params[:teacher_id]
    @improvement_plan.leader = params[:leader]
    @improvement_plan.action_state = params[:action_state]

    save_status = @improvement_plan.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/improvement_plans/#{@improvement_plan.id}/edit", "/update_improvement_plan"
        redirect_to("/improvement_plans/#{@improvement_plan.id}", :notice => "Improvement plan updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Improvement plan updated successfully.")
      end
    else
      render("improvement_plans/edit.html.erb")
    end
  end

  def destroy
    @improvement_plan = ImprovementPlan.find(params[:id])

    @improvement_plan.destroy

    if URI(request.referer).path == "/improvement_plans/#{@improvement_plan.id}"
      redirect_to("/", :notice => "Improvement plan deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Improvement plan deleted.")
    end
  end
end
