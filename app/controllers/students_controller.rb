class StudentsController < BaseController
  before_action :authenticate_request, only: %i[destroy]
  def index
    render_success Student.last(20)
  end

  def create
    result = StudentCreationService.new(student_params).call
    if result[:success]
      response.headers['Authorization'] = "Bearer #{result[:token]}"
      render_success result[:student], status: :created
    else
      render_resource_errors result[:student]
    end
  end

  def destroy
    unless params[:id].match?(/\A\d+\z/)
      render_errors errors: ['Invalid ID'], status: :bad_request
      return
    end
    student = Student.find_by(id: params[:id])
    unless student && @current_student.id == student.id
      render_errors errors: ['Unauthorized'], status: :unauthorized
      return
    end
    student.destroy
    head :no_content
  end

  def class_students
    unless params[:school_id].match?(/\A\d+\z/) && params[:class_id].match?(/\A\d+\z/)
      render_errors errors: ['Invalid ID format'], status: :bad_request
      return
    end

    class_room = ClassRoom.includes(:students)
                          .find_by(id: params[:class_id], school_id: params[:school_id])

    unless class_room
      render_errors errors: ['Class not found'], status: :not_found
      return
    end
    @students = class_room.students
    render :class_students, status: :ok
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :surname, :school_id, :class_id)
  end
end
