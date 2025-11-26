class ClassesController < BaseController
  def index
    school = UchiSchool.find_by(id: params[:school_id])
    unless school
      render_errors errors: ['School not found'], status: :not_found
      return
    end
    @classes = school.classes
    render :classes
  end
end
