require 'rails_helper'

RSpec.describe 'ski resorts ski runs index' do
  it 'shows the all the ski runs for the ski resort' do # user story 5
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
    schoolmarm = keystone.ski_runs.create!(name: 'schoolmarm', open: true, distance: 3, green: true, blue: false,
                                           black: false, condition: 'groomed')
    noodle_soup = keystone.ski_runs.create!(name: 'noodle soup', open: false, distance: 2, green: false, blue: false,
                                            black: true, condition: 'groomed')

    visit "/ski_resorts/#{keystone.id}/ski_runs"

    expect(page).to have_content(schoolmarm.name)
    expect(page).to have_content(noodle_soup.name)
  end

  it 'has a link to all ski runs' do
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
    noodle_soup = keystone.ski_runs.create!(name: 'noodle soup', open: false, distance: 2, green: false, blue: false,
                                            black: true, condition: 'groomed')
    visit "/ski_resorts/#{keystone.id}/ski_runs"
    click_link 'All Ski Runs'
    expect(current_path).to eq('/ski_runs')
  end
end
