class JwtTokenService
  def self.generate_token(student)
    JsonWebToken.encode(student_id: student.id)
  end
end
