class SchoolsController < ApplicationController
  def show
    @school = School.find(params[:id])
  end

  def new
    @school = School.new
  end

  ##
  # POST /schools
  def create
    @school = School.new(school_params)
    
    if @school.save
      log_in @school
      flash[:success] = "Account successfully created"
      redirect_to @school
    else
      render 'new'
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name, :address, :state, :city, :zip_code, :email, :password, :password_confirmation)
    end


end
