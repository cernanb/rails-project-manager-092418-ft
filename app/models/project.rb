class Project < ApplicationRecord
    validates :name, :due_date, presence: true
    # validates :name, exclusion: { in: %w(% *),
    # message: "%{value} is reserved." }

    validates :public_notice, acceptance: { message: 'must be checked!!!' }


    has_many :tasks

    validates_associated :tasks

    validates :email, format: { multiline: true, with: /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/, message: "must be a valid email" }

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
