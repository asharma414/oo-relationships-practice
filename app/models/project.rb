class Project

    attr_reader :name, :author, :goal
    @@all = []

    def initialize(name, author, goal)
        @name, @author, @goal = name, author, goal
        @@all << self
    end

    def self.all
        @@all
    end

    def pledges
        Pledge.all.select {|pledge| pledge.project == self}
    end

    def self.no_pledges
        self.all.select {|project| project.pledges.length == 0}
    end

    def pledge_total
        self.pledges.inject {|sum, pledge| sum.amount + pledge.amount}
    end

    def self.above_goal
        self.all.select {|project| project.pledge_total.to_s > project.goal.to_s}
    end

    def self.most_backers
        self.all.max_by {|project| project.pledges.length }
    end

end