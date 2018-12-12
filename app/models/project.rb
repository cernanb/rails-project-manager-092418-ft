class Project < ApplicationRecord
    validates :name, :due_date, presence: true
    # validates :name, exclusion: { in: %w(% *),
    # message: "%{value} is reserved." }
    belongs_to :user

    validates :public_notice, acceptance: { message: 'must be checked!!!' }


    has_many :tasks
    validates_associated :tasks
    # accepts_nested_attributes_for :tasks

    validates :email, format: { multiline: true, with: /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/, message: "must be a valid email" }

    def tasks_attributes=tasks_hash
        tasks_hash.values.each do |task_hash|
            if !task_hash[:title].include?('angular')
                self.tasks.build(task_hash)
            end
        end
    end

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
