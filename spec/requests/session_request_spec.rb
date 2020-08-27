require 'rails_helper'

RSpec.describe "Sessions", type: :request do
    describe "post #join" do
        it "비밀번호 두개가 틀렸다" do
            post "/join", :params =>{
                :name => "test",
                :email => "test@naver.com",
                :major => "test",
                :password => "123",
                :password_confirmation => "123123"
            }
            
            expect(assigns(:user)).to redirect_to("/")
            expect(flash[:join]).to eql "비밀번호가 같지 않습니다"
        end
        
        it "이메일이 이미 존재한다" do

            @user = User.create(
            :name => "이동규",
            :email => "zkfmapf123@naver.com",
            :major => "컴퓨터공학과",
            :password => "123",
            :password_confirmation => "123"
            )

            post "/join", :params =>{
                :name => "이동규",
                :email => "zkfmapf123@naver.com",
                :major => "컴퓨터공학과",
                :password => "123",
                :password_confirmation => "123"
            }
            
            expect(assigns(:user)).to redirect_to("/")
            expect(flash[:join]).to eql "유효한 이메일이 존재합니다"
        end
        
        it "회원가입이 진행이 돼나?" do
            post "/join", :params =>{
                :name => "이동규",
                :email => "zkfmapf123@naver.com",
                :major => "컴퓨터공학과",
                :password => "123",
                :password_confirmation => "123"
            }
    
            expect(assigns(:user)).to redirect_to("/")
        end
    end

    describe "post #login" do
        it "해당하는 이메일이 없다" do

            post "/login", :params => {
                email: "zkfmapf123@naver.com"
            }

            expect(assigns(:user)).to redirect_to("/")
            expect(flash[:login]).to eql "존재하지 않는 이메일입니다"
        end

        it "해당 이메일에 비밀번호가 틀렸다" do
            @user = User.create(
                name: "이동규",
                email: "zkfmapf123@naver.com",
                major: "컴퓨터공학과",
                password: "123",
                password_confirmation: "123"
            )

            post "/login", :params=>{
                email: "zkfmapf123@naver.com",
                password: "123123"
            }

            expect(assigns(:user)).to redirect_to("/")
            expect(flash[:login]).to eql "비밀번호가 맞지 않습니다"
        end
    end

    describe "forget" do
        it "해당하는 이름이랑 학과가 없다" do
            @user = User.create(
                :name => "이동규",
                :email => "zkfmapf123@naver.com",
                :major => "컴퓨터공학과",
                :password => "123",
                :password_confirmation => "123"
            )

            post "/forget/?id=1",:params =>{
                :name => "이동규스",
                :major => "컴퓨터스"
            }

            expect(assigns(:user)).to redirect_to("/")
            expect(flash[:forget]).to eql "해당하는 이메일이 없습니다"
        end

        it "해당하는 이메일이 존재하지 않는다" do
            @user = User.create(
                :name => "이동규",
                :email => "zkfmapf123@naver.com",
                :major => "컴퓨터공학과",
                :password => "123",
                :password_confirmation => "123"
            )

            post "/forget/?id=2",:params =>{
                :email => "test"
            }

            expect(assigns(:user)).to redirect_to("/")
            expect(flash[:forget]).to eql "해당하는 이메일이 없습니다"
        end

        it "해당하는 이름과 전공에 맞는 이메일이 존재할때" do
            @user = User.create(
                :name => "이동규",
                :email => "zkfmapf123@naver.com",
                :major => "컴퓨터공학과",
                :password => "123",
                :password_confirmation => "123"
            )

            post "/forget/?id=1",:params =>{
                :name => "이동규",
                :major => "컴퓨터공학과"
            }

            expect(assigns(:user)).to redirect_to("/")
            expect(flash[:forget]).to_not eql "해당하는 이메일이 없습니다."
        end

        it "해당하는 이메일이 존재하여 비밀번호를 칠수 있다." do
            @user = User.create(
                :name => "이동규",
                :email => "zkfmapf123@naver.com",
                :major => "컴퓨터공학과",
                :password => "123",
                :password_confirmation => "123"
            )

            post "/forget/?id=2",:params =>{
                :name => "이동규",
                :major => "컴퓨터공학과"
            }

            expect(assigns(:user)).to redirect_to("/")
            expect(flash[:forget]).to_not eql "해당하는 이메일이 없습니다."            
        end
    end
end
