module PremiumCult
    def premium_check
        self.subscriber == "$$$"
    end

    def recruit_follower(follower, date)
        if premium_check
            if follower.age > self.minimum_age
                recruit_follower_method(follower, date)
            else
                "Sorry, too young. Try again in a few years!"
            end
        else
            recruit_follower_method(follower, date)
        end

    end

end