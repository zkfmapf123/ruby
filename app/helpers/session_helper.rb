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
