class HomeController < ApplicationController
    def index

        respond_to do |format|
            format.html{
                render "index"
            }

            format.json{
                render json:{
                    :status => 200
                }
            }
        end
    end
end
