class Api::V1::UsersController < Api::V1::ApiController
  respond_to :json

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: 201
    else
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end

  def show
    @user = User.find(params[:id])
    if @user.present?
      render json: @user
    else
      raise ActiveRecord::RecordNotFound
    end
  end

private

  def user_params
    params.permit(:email, :password, :first_name, :last_name)
  end
end
