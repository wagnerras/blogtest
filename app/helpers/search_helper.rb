module SearchHelper
    def reply?(count)
        if count != 1
            'replies'
        else 
            'reply'
        end
    end
end
