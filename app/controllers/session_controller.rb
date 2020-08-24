class SessionController < ApplicationController
    def login
        render json:{
            :status => 200
        }
    end

    def join
        render json:{
            :status => 200
        }
    end

    def forget
        render json:{
            :status => 200
        }
    end

    def logout
        render json:{
            :status => 200
        }
    end
end
