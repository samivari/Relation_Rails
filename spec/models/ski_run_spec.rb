require 'rails_helper'

RSpec.describe SkiRun, type: :model do
  describe 'relationships' do
    it { should belong_to :ski_resort }
  end
end
