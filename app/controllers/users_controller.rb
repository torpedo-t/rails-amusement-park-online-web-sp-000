class UsersController < ApplicationController

    def new
        # signup form
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            redirect_to controller: 'users', action: 'create'
        end
    end

    def root

    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end

end