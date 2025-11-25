class BaseController < ActionController::API
  def render_errors(errors: [], status: :unprocessable_entity)
    render json: { success: false, errors: }, status:
  end

  def render_resource_errors(resource, status: :unprocessable_entity)
    result = resource.errors.attribute_names.map do |attr|
      { key: attr, messages: resource.errors.full_messages_for(attr) }
    end
    render_errors errors: result, status:
  end

  def render_success(resource = nil, status: :ok, token: nil)
    render json: resource, status:, success: true, token:
  end

  def authenticate_request
    token = request.headers['Authorization']&.split(' ')&.last
    begin
      decoded = JsonWebToken.decode(token)
      @current_student = Student.find(decoded['student_id'])
    rescue StandardError => e
      render json: { errors: e.message , message: 'Token is invalid'}, status: :unauthorized
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
