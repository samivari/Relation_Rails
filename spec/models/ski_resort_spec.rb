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

  describe 'class methods' do
    describe '::sorted' do
      it 'sorts ski resorts in descending order' do
        SkiResort.destroy_all
        keys = SkiResort.create!(name: 'Cool guy mountain', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
        bro_mnt = SkiResort.create!(name: 'hood stuff', lifts: 24, backcountry_access: false, employee: 23_000,
                                    snowboarder_permitted: true, altitude: 10_280, avg_snowfall: 333, location: 'Summit County')

        expect(SkiResort.sorted.to_a).to eq([bro_mnt, keys])
      end
    end
  end

  describe 'instance methods' do
    describe '#count runs' do
      it 'counts the run at a resort' do
        keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                     snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
        schoolmarm = keystone.ski_runs.create!(name: 'schoolmarm', open: true, distance: 3, green: true, blue: false,
                                               black: false, condition: 'groomed')
        noodle_soup = keystone.ski_runs.create!(name: 'noodle soup', open: false, distance: 6, green: false, blue: false,
                                                black: true, condition: 'groomed')
        expect(keystone.count_runs).to eq(2)
      end
    end
  end
end
