require 'rails_helper'

RSpec.describe SkiResort, type: :model do
  describe 'relationships' do
    it { should have_many :ski_runs }
  end
end
