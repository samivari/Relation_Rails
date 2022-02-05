require 'rails_helper'

RSpec.describe SkiResort, type: :model do
  describe 'relationships' do
    it { should have_many(:ski_runs) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :lifts }
    it { should allow_value(false).for(:backcountry_access) }
    it { should validate_presence_of :employee }
    it { should allow_value(false).for(:snowboarder_permitted) }
    it { should validate_presence_of :altitude }
    it { should validate_presence_of :avg_snowfall }
    it { should validate_presence_of :location }
  end
end
