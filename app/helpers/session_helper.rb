module SessionHelper
    attr_reader :user

    #유저저장
    def register_user(user)
        return session[:user_id] = user.id
    end

    #유저반환
    def current_user
        return @user ||= User.find_by_id(session[:user_id])
    end

    def user_alert
        if current_user().alert >= 0 && current_user().alert <=3
            "선량한 시민"
        elsif current_user().alert >=3 && current_user().alert <=6
            "말썽꾸러기" 
        elsif current_user().alert >=7 && current_user().alert <=10
            "혁명가"
        else
            "곧 신고"
        end
    end

    def user_login
        if current_user() == nil
            return false
        else
            return true
        end
    end

    #로그인된 경우
    def isUser
        if user_login()
            redirect_to :controller => "home", action: "index"
        end
    end

    #로그인 안된경우
    def isNotUser
        if !user_login()
            redirect_to :controller => "home", action: "index"
        end
    end
end
