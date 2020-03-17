class BloodOath

    attr_accessor :month, :day, :year, :cult, :follower
    @@all = []

    def initialize(month, day, year, cult, follower)
        @month = month
        @day = day
        @year = year
        @cult = cult
        @follower = follower
        @@all << self
    end

    def self.all
        @@all
    end

    def initiation_date
        "_#{year}-#{month}-#{day}_"
    end

    def self.first_oath
        @@all.sort_by{|oath| oath.day}
        @@all.sort_by{|oath| oath.month}
        @@all.sort_by{|oath| oath.year}
        @@all.first
    end

end