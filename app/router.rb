class Router
  ROUTES = [
    { method: 'GET',  path: /\/users\/([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})$/, controller: 'UsersController', action: :show },
    { method: 'GET',  path: /\/users\/?$/, controller: 'UsersController', action: :index },
    { method: 'POST', path: /\/users\/?$/, controller: 'UsersController', action: :create }
  ]

  def self.route(request)
    ROUTES.each do |route|
      if route[:path] =~ request.path_info && route[:method] == request.request_method
        params = { id: $1 }
        return route[:controller].constantize.new(request, params).public_send(route[:action])
      end
    end

    nil
  rescue StandardError => e
    ActiveRecord::Base.logger.error("Error while processing request: #{request} error: #{e.message} backtrace: e.backtrace.join(\"\n\")" )
    raise e
  end
end