class UsersController < ApplicationController
    before_action :authenticate, only: [:update, :destroy]
    
    def index
    end

    def new
    end

    def create
    end

    def show
    end

    def update
    end

    def edit
    end

    def destroy
    end

end
