require 'rails_helper'

RSpec.describe "Sessions", type: :request do
    describe "#join" do
        it '회원가입이 잘 되었다' do
            post "/"
            expect(response.status).to eql 200
        end
    end

    describe "#login" do
    
    end

    describe "#forget" do
        
    end

    describe "#logout" do
        
    end
end
