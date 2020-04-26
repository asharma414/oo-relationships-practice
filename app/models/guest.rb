class Guest

    attr_reader :name
    attr_accessor :trip_count
    @@all = []

    def initialize(name)
        @name = name
        @trip_count = 0
        @@all << self
    end

    def self.all
        @@all
    end
    
    def new_trip(listing)
        Trip.new(self, listing)
    end

    def trips
        Trip.all.select {|trip| trip.guest == self}
    end

    def listings
        self.trips.map {|trip| trip.listing}
    end

    def self.pro_traveller
        self.all.select {|guest| guest.trip_count > 1}
    end

    def self.find_all_by_name(name)
        self.all.select {|guest| guest.name == name}
    end

end