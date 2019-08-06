class RackApp
  def call (env)
    request = Rack::Request.new(env)
    default_response = Rack::Response.new(["{data: 'not_found'}"], 404, {"Content-Type" => "application/json"})

    ActiveRecord::Base.logger = Logger.new('log/rack_app.log')
    ActiveRecord::Base.establish_connection(YAML::load(File.open('config/database.yml'))[ENV['RACK_ENV'] || 'development'])
    begin
      Router.route(request) || default_response
    rescue StandardError => e
      Rack::Response.new([{data: 'server_error', message: e.message}.to_json], 500, {"Content-Type" => "application/json"})
    end
  end
end