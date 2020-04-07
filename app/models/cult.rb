class Cult

    attr_accessor :name, :location, :founding_year, :slogan, :minimum_age
    @@all = []

    def initialize(name, location, founding_year, slogan, minimum_age)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @minimum_age = minimum_age
        @@all << self
    end

    def recruit_follower(follower, month, day, year)
        BloodOath.new(month, day, year, self, follower)
    end

    def cult_population
        BloodOath.all.select{|oath| oath.cult == self}.length
    end

    def self.all
        @@all
    end

    def self.find_by_name(cult_name)
        @@all.select{|cult| cult.name == cult_name}.first
    end

    def self.find_by_location(location)
        @@all.select{|cult| cult.location == location}
    end

    def self.find_by_founding_year(year)
        @@all.select{|cult| cult.founding_year == year}
    end

    def average_age
        inducted = BloodOath.all.select{|oath| oath.cult == self}
        ages = inducted.map do |oath|
            oath.follower.age
        end
        ages.sum / ages.length
    end

    def my_followers_mottos
        inducted = BloodOath.all.select{|oath| oath.cult == self}
        inducted.map do |oath|
            oath.follower.life_motto
        end
    end

    def self.least_popular
        cult_hash = {}
        BloodOath.all.each do |oath|
            follower_count = BloodOath.all.select{|oath2| oath2.cult == oath.cult}.length
            cult_hash[oath.cult] = follower_count
        end
        cult_hash.min_by{|k, v| v}
    end

    def self.most_common_location
        cult_hash = {}
        BloodOath.all.each do |oath|
            follower_count = BloodOath.all.select{|oath2| oath2.cult == oath.cult}.length
            cult_hash[oath.cult] = follower_count
        end
        most_pop_cult = cult_hash.max_by{|k, v| v}
        most_pop_cult.first.location
    end

end