require 'rails_helper'

RSpec.describe 'ski run index' do
  it 'shows the ski run name and other attributes' do
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
    schoolmarm = keystone.ski_runs.create!(name: 'schoolmarm', open: true, distance: 3, green: true, blue: false,
                                           black: false, condition: 'groomed')
    noodle_soup = keystone.ski_runs.create!(name: 'noodle soup', open: false, distance: 2, green: false, blue: false,
                                            black: true, condition: 'groomed')

    visit '/ski_runs'

    expect(page).to have_content(schoolmarm.name)
    expect(page).to have_content(schoolmarm.open)
    expect(page).to have_content(schoolmarm.distance)
    expect(page).to have_content(schoolmarm.green)
    expect(page).to have_content(schoolmarm.blue)
    expect(page).to have_content(schoolmarm.black)
    expect(page).to have_content(schoolmarm.condition)
  end
end
