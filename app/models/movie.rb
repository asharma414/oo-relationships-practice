class Movie

    attr_reader :title
    @@all = []

    def initialize(title)
        @title = title
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_actors
        self.all.max_by { |movie| movie.characters.length }
    end

    def characters
        Character.all.select {|char| char.storyline.include?(self)}
    end


end