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

    #로그인된 경우
    def isUser
        if current_user() != nil
            
        end
    end

    #로그인 안된경우
    def isNotUser
        if current_user() == nil
            
        end
    end
end
