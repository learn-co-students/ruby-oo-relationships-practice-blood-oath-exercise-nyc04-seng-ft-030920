class BloodOath
    attr_reader :date, :follower, :cult
    @@all = []

    def initialize(date, follower, cult)
        @date = date
        @follower = follower
        @cult = cult
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        (self.all.sort_by {|oath| oath.date})[0]
    end
end