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

  describe 'class methods' do
    describe '::is_open' do
      it 'checks if the run is open' do
        SkiResort.destroy_all
        keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                     snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
        schoolmarm = keystone.ski_runs.create!(name: 'schoolmarm', open: true, distance: 3, green: true, blue: false,
                                               black: false, condition: 'groomed')
        noodle_soup = keystone.ski_runs.create!(name: 'noodle soup', open: false, distance: 2, green: false, blue: false,
                                                black: true, condition: 'groomed')

        expect(SkiRun.is_open).to eq([schoolmarm])
      end
    end
    describe '::greater_than' do
      it 'filters ski runs with a specific distance' do
        SkiResort.destroy_all
        keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                     snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
        schoolmarm = keystone.ski_runs.create!(name: 'schoolmarm', open: true, distance: 3, green: true, blue: false,
                                               black: false, condition: 'groomed')
        noodle_soup = keystone.ski_runs.create!(name: 'noodle soup', open: false, distance: 2, green: false, blue: false,
                                                black: true, condition: 'groomed')

        expect(SkiRun.greater_than(2)).to eq([schoolmarm])
      end
    end
  end
end
