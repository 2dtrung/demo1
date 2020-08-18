class Form2Controller < ApplicationController
  def index
    @form2 = Form2.where(user_id: current_user.id)
    respond_to do |format|
      format.html
      format.csv { send_data @form2.as_csv}
    end
  end
  def new
    @form2 = Form2.new
  end
  def show
    @form2 = Form2.where(user_id: current_user.id)
  end
  def create
    @form2 =  Form2.new(form2_params.merge(user_id: current_user.id))
    if @form2.save
      redirect_to current_user
    else
      render 'new'
    end
  end
  private
    def form2_params
      params.require(:form2).permit(:company_name, :tax_code, :address, :name, :position, :date, :work_des, :income)
    end
end
