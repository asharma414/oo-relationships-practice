class Character

    attr_reader :name, :actor, :storylines
    @@all = []

    def initialize(name, actor)
        @name, @actor, @storylines = name, actor, []
        @@all << self
    end

    def storylines=(medium)
        @storylines << medium
    end

end