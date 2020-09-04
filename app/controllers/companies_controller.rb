class CompaniesController < ApplicationController
  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.where(user_id: current_user.id)
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params.merge(user_id: current_user.id))
    if @company.save
      redirect_to user_companies_path(current_user)
    else
      render "new"
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      # Handle a successful update.
      flash[:success] = "Thông tin đã được cập nhật!"
      redirect_to user_companies_path(current_user)
    else
      render "edit"
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to user_companies_path(current_user)
  end

  private
    def company_params
      params.require(:company).permit(:company_name, :tax_code, :address, :position)
    end
end
