module ApplicationHelper

    def name_link(friend)
        friend.user_profile.name? ? friend.user_profile.name : ''
    end

    def avatar_link(friend)
         friend.user_profile.avatar.attached? ? friend.user_profile.avatar  : 'default-user.png'   
    end

    def avatar_url
        avatar = current_user.user_profile.avatar
        avatar.attached? ? avatar : 'default-user.png'
    end

    def article_user_name(article)
        article.user.user_profile.name? ? article.user.user_profile.name : article.user.email
    end

    def param_name_link(friend)
        friend.user_profile.name? ? friend.user_profile.name : friend.email
    end
    
end