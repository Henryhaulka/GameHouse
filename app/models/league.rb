class League < ApplicationRecord
    has_many :votes, foreign_key: :league_id
    has_many :relates
    has_many :categories, through: :relates
    belongs_to :author, class_name: 'User'
    validates :title, presence: true, length: { mininum: 3, maximum: 20}
    validates :text, presence: true, length: {maximum: 500}
    has_attached_file :image, styles: { large: "1200x1000", medium: "300x300>"}, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    def self.most_voted_league
        leagues = League.includes(:votes).sort { |a, b| a.votes.size <=> b.votes.size }.reverse
        leagues.first
    end
end
