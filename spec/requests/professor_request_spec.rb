require 'rails_helper'

RSpec.describe "Professors", type: :request do
    describe "get #index" do
        subject{ get "/professor" }

        it "회원이 아니라면 메인화면으로 간다" do
            expect(subject).to redirect_to "/"
        end
    end
end
