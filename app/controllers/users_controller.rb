class UsersController < ApplicationController
  include ErrorHandleable
  include UsersOperations

  def index
    op = operations :select
    users = op.call.result
    render json: {
        collection: users.map { |user| serialize_user(user) }
    }
  end

  def create
    op = operations :create
    op.attributes = create_user_params
    op.call
    render status: :created, json: {
        object: {
            id: op.result.id
        }
    }
  end

  def update
    op = operations :update
    op.id = params[:id]
    op.attributes = update_user_params
    op.call
    render status: :ok, json: {
        object: serialize_user(op.result)
    }
  end

  private

  def operations(name)
    case name
      when :select
        Select.new
      when :create
        Create.new
      when :update
        Update.new
      else
        raise "#{name} is not implemented yet"
    end

  end

  def create_user_params
    params.require(:user).permit(:username, :password, :email)
  end

  def update_user_params
    params.require(:user).permit(:password, :is_active, :email)
  end

  def serialize_user(user)
    {
        id: user.id,
        username: user.username,
        is_active: user.is_active,
        email: user.email
    }
  end
end
