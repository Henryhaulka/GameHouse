require 'rails_helper'
RSpec.describe Relate, type: :model do
  describe 'associations' do
    it { should belong_to(:league) }
    it { should belong_to(:category) }
  end

end

