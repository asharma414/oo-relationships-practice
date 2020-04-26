class User

    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def create_project(name, goal)
        Project.new(name, self, goal)
    end

    def created_projects
        Project.all.select {|project| project.author == self}
    end

    def back_project(amount, project)
        Pledge.new(amount, self, project)
    end

    def backed_projects
        pledges = Pledge.all.select {|pledge| pledge.user == self }
    end

    def self.highest_pledge
        (Pledge.all.max_by {|pledge| pledge.amount}).user
    end

    def self.multi_pledger
        self.all.select {|pledger| pledger.backed_projects.length > 1}
    end

    def self.project_creator
        self.all.select {|user| user.created_projects.length > 0}
    end

end