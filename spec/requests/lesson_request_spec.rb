require 'rails_helper'

RSpec.describe "Lessons", type: :request do

=begin
    describe "get #index" do
        subject{ get "/lesson" }

        it "회원이 아니라면 메인화면으로 간다" do
            expect(subject).to redirect_to "/"
        end
    end
=end

    describe "get #index inUser" do
        subject {get "/lesson"}

        it "회원이라면 lesson 화면으로 간다" do
            expect(subject).to eql 200 
        end
    end

    describe "get #detail isUser" do
        subject {get "/lesson/:12/detail"}

        it "회원의 detail화면을 누른다" do
            expect(subject).to eql 200
        end
    end
end
