class SchoolsControllers < ApplicationController
  def index
    @school = School.all
  end

  def new
    @school = School.new
  end

  def show
  end

  def create
    @school = School.new(school_params)

    if @school.save
      redirected_to @school
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @school.update(school_params)
      redirected_to @school
    else
      render 'new'
    end
  end


  private

  def school_params
    params.require(:school).permit(:s_name, :s_address, :phone_no)
  end
end
