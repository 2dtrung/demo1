class Form1Controller < ApplicationController
  def index
    @form1 = Form1.where(user_id: current_user.id)
    respond_to do |format|
      format.html
      format.csv { send_data @form1.as_csv }
    end
  end
  def edit
    @form1 = Form1.find(params[:id])
  end

  def update
    @form1 = Form1.find(params[:id])
    if @form1.update(form1_params)
      # Handle a successful update.
      flash[:success] = "Thông tin đã được cập nhật!"
      redirect_to user_form1_path
    else
      render "edit"
    end
  end

  def destroy
    @form1 = Form1.find(params[:id])
    @form1.destroy
    redirect_to user_form1_path
  end

  def show
    @form1 = Form1.where(user_id: current_user.id)
  end

  def create
    @form1 = Form1.new(form1_params.merge(user_id: current_user.id))
    @form1.image.attach(params[:form1][:image])
    if @form1.save
      redirect_to current_user
    else  
      render "new"
    end
  end

  private

    def form1_params
      params.require(:form1).permit(:name, :time_work, :job, :date, :customer, :income, :work_des, :image, :role_ids => [])
    end
end
