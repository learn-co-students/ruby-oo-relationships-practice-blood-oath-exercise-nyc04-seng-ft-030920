class Follower

    attr_accessor :name, :age, :life_motto
    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def cults
        oath_follower = BloodOath.all.select{|oath| oath.follower == self}
        oath_follower.map(&:cult)
    end

    def join_cult(cult, month, day, year)
        if self.age > cult.minimum_age
            BloodOath.new(month, day, year, cult, self)
        else
            "Sorry, you're too young to join this cult. You must be older than #{cult.minimum_age}."
        end
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        @@all.select{|follower| follower.age >= age}
    end

    def my_cults_slogans
        cults.map(&:slogan)
    end

    def self.follower_activity_sort
        follower_activity = self.all.map do |follower|
          {follower => follower.cults.length}
        end
        sorted_follower_activity = follower_activity.sort_by do |follower|
          follower.values[0]
        end
        sorted_follower_activity.reverse
     end

    def self.top_ten
        follower_activity_sort[0...9]
    end
    
    def self.most_active
        self.follower_activity_sort[0]
    end

    def fellow_cult_members
        oath_hold = []
        cults.each do |cult_name|
            oath_hold << BloodOath.all.select{|oath| oath.cult == cult_name}
        end
        oath_hold.each {|oath| oath.map(&:follower)}
    end

end


