module PremiumFollower
    def premium_check
        self.subscriber == "$$$"
    end

    def premium_cult_members
        if premium_check
            fellow_members = self.cults.map {|cult| cult.cult_followers}
            fellow_members.flatten.uniq.select {|follower| follower != self}
        else
            "Please subscribe for premium functions."
        end
    end
end
