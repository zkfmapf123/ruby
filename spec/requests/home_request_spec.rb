require 'rails_helper'

RSpec.describe "Homes", type: :request do
    describe 'GET /' do
        it '메인화면 status code 200 ?' do
           get "/"
           
           expect(response.status).to eql 200
        end
    end
end
