class Form1Controller < ApplicationController
  def index
    @form1 = Form1.where(user_id: current_user.id)
    respond_to do |format|
      format.html
      format.csv { send_data @form1.as_csv }
    end
  end

  def new
    @form1 = Form1.new
  end

  def show
    @form1 = Form1.where(user_id: current_user.id)
  end

  def create
    @form1 = Form1.new(form1_params.merge(user_id: current_user.id))
    if @form1.save
      redirect_to current_user
    else
      render "new"
    end
  end

  private

  def form1_params
    params.require(:form1).permit(:name, :time_work, :job, :date, :customer, :income, :work_des)
  end
end
