class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(set_params)
    if @company.save
      redirect_to @company
    else
      flash.now[:alert] = 'Não é possível cadastrar empresa.'
      render :new
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  private

  def set_params
    params.require(:company).permit(:legal_name, :mail, :legal_number)
  end
end
