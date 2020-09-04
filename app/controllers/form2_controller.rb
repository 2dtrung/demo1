class Form2Controller < ApplicationController
  def index
    @form2 = Form2.where(user_id: current_user.id)
    respond_to do |format|
      format.html
      format.csv { send_data @form2.as_csv}
    end
  end
  def edit
    @form2 = Form2.find(params[:id])
  end

  def update
    @form2 = Form2.find(params[:id])
    if @form2.update(form2_params)
      # Handle a successful update.
      flash[:success] = "Thông tin đã được cập nhật!"
      redirect_to user_form2_path
    else
      render "edit"
    end
  end

  def destroy
    @form2 = Form2.find(params[:id])
    @form2.destroy
    redirect_to user_form2_path
  end
  
  def new
    @form2 = Form2.new
  end
  def show
    @form2 = Form2.where(user_id: current_user.id)
  end
  def create
    @form2 = Form2.new(form2_params.merge(user_id: current_user.id))
    @form2.image.attach(params[:form2][:image])
    if @form2.save
      redirect_to current_user
    else
      render "new"
    end
  end

  private

    def form2_params
      params.require(:form2).permit(:company_name, :tax_code, :address, :name, :position, :date, :work_des, :income, :image, :role_ids => [])
    end
end
