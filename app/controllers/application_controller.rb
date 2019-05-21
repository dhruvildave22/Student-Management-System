class ApplicationController < ActionController::Base
  include Response
  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    klass.new(object, view_context)
  end

  # def comparison
  #   @comp_date = Student.create(comp_params)
  #   respond_to do |format|
  #     if @camp_date.save
  #       format.json { render json: @camp_date, status: :created }
  #     end
  #   end
  # end

  # private 
  # def comp_params
  #   params.require(:student).permit(:DATE_MIN_COUNT)
  # end
end
