class BloodOath

    attr_accessor :month, :day, :year, :cult, :follower
    @@all = []

    def initialize(month, day, year, cult, follower)
        @month = month
        @day = day
        @year = year
        @cult = cult
        if follower.age < cult.minimum_age
            "Sorry, you're too young to join. The age restriction for this cult is #{cult.minimum_age} or older."
        else 
            @follower = follower
        @@all << self
        end
    end

    def self.all
        @@all
    end

    def initiation_date
        "_#{year}-#{month}-#{day}_"
    end

    def self.first_oath
        # get the oldest follower
        BloodOath.all.select()
    end

end