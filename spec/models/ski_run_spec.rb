require 'rails_helper'

RSpec.describe SkiRun, type: :model do
  describe 'relationships' do
    it { should belong_to :ski_resort }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :distance }
    it { should validate_presence_of :condition }
    it { should allow_value(false).for(:open) }
    it { should allow_value(false).for(:green) }
    it { should allow_value(false).for :blue }
    it { should allow_value(false).for :black }
  end
end
