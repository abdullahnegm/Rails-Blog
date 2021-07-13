class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def profile
        render 'users/profile'
    end

end