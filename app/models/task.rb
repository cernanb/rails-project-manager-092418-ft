class Task < ApplicationRecord
    belongs_to :project, optional: true
    validates :title, presence: true
end
