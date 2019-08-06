class BaseController
  attr_accessor :request, :response, :params

  def initialize(request, params)
    @request = request
    @params = params.merge(params_from_request_body)
    @response = Rack::Response.new([], 200, {"Content-Type" => "application/json"})
  end

  protected

  def success_response(data)
    response.status = 200
    response.body = [serialize({data: data})]
    response
  end

  def error_response(data, code, message)
    response.status = code
    response.body = [serialize({data: data, message: message})]
    response
  end

  def params_from_request_body
    request_body = request.body.read
    request_body.present? ? JSON.parse(request_body) : {}
  end

  def serialize(data)
    ActiveModelSerializers::SerializableResource.new(data).to_json
  end
end