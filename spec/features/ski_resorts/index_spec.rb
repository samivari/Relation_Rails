require 'rails_helper'

RSpec.describe 'ski resort index' do
  it 'shows all of the ski resorts' do
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
    breck = SkiResort.create!(name: 'Breckinridge', lifts: 24, backcountry_access: false, employee: 23_000,
                              snowboarder_permitted: true, altitude: 10_280, avg_snowfall: 333, location: 'Summit County')
    schoolmarm = keystone.ski_runs.create!(name: 'schoolmarm', open: true, distance: 3, green: true, blue: false,
                                           black: false, condition: 'groomed')
    noodle_soup = keystone.ski_runs.create!(name: 'noodle soup', open: false, distance: 2, green: false, blue: false,
                                            black: true, condition: 'groomed')
    way_back = breck.ski_runs.create!(name: 'way back', open: true, distance: 1, green: false, blue: true,
                                      black: false, condition: 'powder')
    egg_nog = breck.ski_runs.create!(name: 'egg nog', open: true, distance: 4, green: true, blue: false, black: false,
                                     condition: 'ice')

    visit '/ski_resorts'

    expect(page).to have_content(keystone.name)
    expect(page).to have_content(breck.name)
  end
end
