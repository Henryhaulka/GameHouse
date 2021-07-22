class League < ApplicationRecord
    belongs_to :author, class_name: 'User'
    validates :title, presence: true, length: { mininum: 3, maximum: 20}
    validates :text, presence: true, length: {maximum: 500}
end
