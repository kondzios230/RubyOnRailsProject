module ComentsHelper

  #Method finds user for comment
    def user_for_comment (comment)
        User.find(comment.user_id)
    end
end
