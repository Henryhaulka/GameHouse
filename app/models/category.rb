class Category < ApplicationRecord
    has_many :relates
    has_many :leagues, through: :relates
end
