class Form2Controller < ApplicationController
  def new
    @form2 = Form2.new
  end
  def show
    @form2 = Form2.find(params[:id])
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
