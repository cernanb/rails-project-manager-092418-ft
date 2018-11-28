class Project < ApplicationRecord
    validates :name, :due_date, presence: true

    has_many :tasks

    def complete
        # binding.pry 
        # self.tasks.find_all{|t| t.complete}
        self.tasks.where(complete: true)
    end 
    
    def incomplete 
        # self.tasks.find_all{|t| !t.complete}
        self.tasks.where(complete: false)
    end 
end
