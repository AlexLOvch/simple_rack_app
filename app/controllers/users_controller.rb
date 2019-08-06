class UsersController < BaseController
  def index
    success_response(User.all)
  end

  def show
    user = User.find_by_id(params[:id])

    if user
      success_response(user)
    else
      error_response('user_not_found', 404, 'User not found')
    end
  end

  def create
    user = User.new(params)

    if user.save
      success_response(user)
    else
      error_response(user.error_code, 400, user.errors.full_messages)
    end
  end
end