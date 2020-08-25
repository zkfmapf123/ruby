class SessionController < ApplicationController
    attr_reader :user, :status_code

    def login
        begin
            valid_email_password("login")
            
            #로그인처리
            register_user(@user)
            redirect_to :controller => "home", action: "index"

        rescue => exception
            flash[:login] = @message
            redirect_to :controller => "home", action: "index"
        end
        
    end

    def join
        begin
            valid_email_password("join")

            @user = User.new(
                name: params[:name],
                email: params[:email],
                major: params[:major],
                password: params[:password],
                password_confirmation: params[:password]
            )

            if @user.valid? == false
                @message = "올바르지 않습니다"
                rails "error"
            end 

            @user.save

            flash[:join] =""
            redirect_to :controller => "home", action: "index"

        rescue => exception
            flash[:join] = @message
            redirect_to :controller => "home", action: "index"
        end
    
    end

    private

    def valid_email_password(index)
        @user = User.find_by_email(params[:email])

        if index == "join" #회원가입 시
            if @user != nil
                @message = "유요한 이메일이 존재합니다"
                rails "error"
            end
            if params[:password] != params[:passwordCheck]
                @message = "비밀번호가 같지 않습니다"
                rails "error"
            end
        else #로그인 시
            if @user == nil
                @message = "존재하지 않는 이메일입니다"
                rails "error"
            end
            if !!@user.authenticate(params[:password]) == false
                @message = "비밀번호가 맞지 않습니다"
                rails "error"
            end
        end
    end
end
