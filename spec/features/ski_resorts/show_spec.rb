require 'rails_helper'

RSpec.describe 'ski resort show' do
  it 'shows the ski resorts name and other attributes' do
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
    schoolmarm = keystone.ski_runs.create!(name: 'schoolmarm', open: true, distance: 3, green: true, blue: false,
                                           black: false, condition: 'groomed')
    noodle_soup = keystone.ski_runs.create!(name: 'noodle soup', open: false, distance: 2, green: false, blue: false,
                                            black: true, condition: 'groomed')

    visit "/ski_resorts/#{keystone.id}"

    expect(page).to have_content(keystone.name)
    expect(page).to have_content(keystone.backcountry_access)
    expect(page).to have_content(keystone.employee)
    expect(page).to have_content(keystone.snowboarder_permitted)
    expect(page).to have_content(keystone.altitude)
    expect(page).to have_content(keystone.avg_snowfall)
    expect(page).to have_content(keystone.location)
  end
end
