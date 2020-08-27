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
                raise "error"
            end 

            @user.save

            flash[:join] =""
            redirect_to :controller => "home", action: "index"

        rescue
            flash[:join] = @message
            redirect_to :controller => "home", action: "index"
        end
    
    end

    def forget
        begin
            if params[:id] == "1"
                #아이디 찾기
                @user = User.where(name: params[:name], major: params[:major])
                valid_email(@user)

                flash[:forget]= @user[0].email
            else
                #비밀번호찾기
                @user = User.where(email: params[:email])
                valid_email(@user)

                flash[:forget] = @user[0].email
            end
            redirect_to :controller => "home", action: "index"
        rescue
            flash[:forget] = @message
            redirect_to :controller => "home", action: "index"
        end
    end

    private
    def valid_email(user)
        if user.empty?
            @message = "해당하는 이메일이 없습니다"
            raise "error"
        end
    end

    def valid_email_password(index)
        @user = User.find_by_email(params[:email])

        if index == "join" #회원가입 시
            if @user != nil
                @message = "유효한 이메일이 존재합니다"
                raise "valid email error"
            end
            if params[:password] != params[:passwordCheck]
                @message = "비밀번호가 같지 않습니다"
                raise "diff password"
            end
        else #로그인 시
            if @user == nil
                @message = "존재하지 않는 이메일입니다"
                raise "not exists email"
            end
            if !!@user.authenticate(params[:password]) == false
                @message = "비밀번호가 맞지 않습니다"
                raise "not correct password"
            end
        end
    end
end
