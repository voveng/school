class StudentCreationService
  def initialize(student_params)
    @student_params = student_params
  end

  def call
    student = Student.new(@student_params)
    if student.save
      token = JwtTokenService.generate_token(student)
      { student: student, token: token, success: true }
    else
      { student: student, success: false }
    end
  end
end
