class UsersController < ApplicationController
    before_action :authenticate, only: [:update, :destroy]
    
    def index
        users = User.all;
        render json: {user: users}
    end

    def new
    end

    def create
        secret_key = Rails.application.secrets.secret_key_base[0];
        @user = User.create(user_params)
          if @user.valid?
            @token = JWT.encode({user_id: @user.id,
              username: @user.username
          }, secret_key)
            render json: { user: User.all, token: @token }, status: :created
          else
            render json: {error: "Failed to create a user"}
          end
        end

    def show
    end

    def update
    end

    def edit
    end

    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :birthday, :bio, :password)
    end

end
