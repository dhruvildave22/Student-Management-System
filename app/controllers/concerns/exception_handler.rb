# rescue ActiveRecord::RecordNotFound => e
#     respond_to do |format|
#       format.json { render json: { error: e.message }, status: :not_found }
#     end
#   end


# module ExceptionHandler
#   # provides the more graceful `included` method
#   extend ActiveSupport::Concern

#   included do
#     rescue_from ActiveRecord::RecordNotFound do |e|
#       json_response({ message: e.message }, :not_found)
#     end

#     rescue_from ActiveRecord::RecordInvalid do |e|
#       json_response({ message: e.message }, :unprocessable_entity)
#     end
#   end
# end

# module Response
#   def json_response(object, status = :ok)
#     render json: object, status: status
#   end
# end

#   def show
#     @student = Student.find(params[:id])
#     respond_to do |format|
#       format.html {}
#       format.json { render json: { student: @student }, status: :ok }
#     end
#   rescue ActiveRecord::RecordNotFound => e
#     respond_to do |format|
#       format.json { render json: { error: e.message }, status: :not_found }
#     end
#   end
