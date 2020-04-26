class Show

    attr_reader :title, :characters
    @@all = []

    def initialize(title, characters)
        @title, @characters = title, characters
        @@all << self
    end

    def on_the_big_screen
        Movie.all.select {|movie| movie.title == self.title }
    end

end