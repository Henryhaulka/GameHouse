require 'rails_helper'
RSpec.describe League, type: :model do
    describe 'associations' do
      it { should belong_to(:author) }
    end
  
    describe 'validations' do
      it { should validate_presence_of(:text) }
      it { should validate_length_of(:text).is_at_most(500) }

      it { should validate_presence_of(:title) }
      it { should validate_length_of(:title).is_at_most(20) }
    end
  end