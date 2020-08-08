class Cult
attr_accessor :name, :location, :slogan, :subscriber
attr_reader :yr_estab
attr_writer :min_age
include PremiumCult

@@all = []

    def initialize(name, location, yr_estab, slogan, subscriber = nil)
        @name = name
        @location = location
        @yr_estab = yr_estab
        @slogan = slogan
        @subscriber = subscriber
        @min_age = 25
        @@all << self
    end

    def self.all
        @@all
    end

    def cult_followers
        oath_array = BloodOath.all.select {|oath| oath.cult == self}
        oath_array.map(&:follower)
    end

    def cult_population
        cult_followers.length
    end

    def self.find_by_name(cult_name)
        self.all.detect {|cult| cult.name == cult_name}
    end

    def self.find_by_location(loc)
        self.all.select {|cult| cult.location == loc}
    end

    def self.find_by_founding_year(year)
        self.all.select {|cult| cult.yr_estab == year}
    end

    def average_age
        age_array = cult_followers.map(&:age)
        (age_array.sum.to_f / cult_population.to_f).round(2)
    end

    def my_followers_mottos
        cult_followers.map {|follower| p "#{follower.motto}"}
    end

    def self.least_popular
        self.all.min_by {|cult| cult.cult_population}
    end

    def self.most_common_location
        location_array = (self.all.map {|cult| cult = cult.location}).uniq
        num_array = location_array.map {|location| self.find_by_location(location).count}
        location_array[num_array.find_index(num_array.max)]
    end

    def minimum_age
        @min_age
    end

    private

    def recruit_follower_method(follower, date)
        BloodOath.new(date, follower, self)
    end
end