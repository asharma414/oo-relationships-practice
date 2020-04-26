class Pledge

    attr_reader :amount, :user, :project
    @@all = []

    def initialize(amount, user, project)
        @amount, @user, @project, = amount, user, project
        @@all << self
    end

    def self.all
        @@all
    end

end