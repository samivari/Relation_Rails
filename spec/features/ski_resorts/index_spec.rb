require 'rails_helper'

RSpec.describe 'ski resort index' do
  it 'shows all of the ski resorts' do # user story 1
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

  it 'sorts the parent index by most recently created' do # user story 6
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
    breck = SkiResort.create!(name: 'Breckinridge', lifts: 24, backcountry_access: false, employee: 23_000,
                              snowboarder_permitted: true, altitude: 10_280, avg_snowfall: 333, location: 'Summit County')
    visit '/ski_resorts'

    expect(breck.name).to appear_before(keystone.name)
  end

  it 'has a link to all ski runs' do
    visit '/ski_resorts'
    click_link 'All Ski Runs'
    expect(current_path).to eq('/ski_runs')
  end

  it 'has a link to all ski resorts' do
    visit '/ski_runs'
    click_link 'All Ski Resorts'
    expect(current_path).to eq('/ski_resorts')
  end

  it 'has a form to create a new ski resort' do
    visit '/ski_resorts'

    click_link 'New Ski Resort'

    expect(current_path).to eq('/ski_resorts/new')

    fill_in 'name', with: 'Copper Mountain'
    fill_in 'lifts', with: '22'
    fill_in 'employee', with: '2000'
    fill_in 'altitude', with: '12_000'
    fill_in 'avg_snowfall', with: '33'
    fill_in 'Location', with: 'Frisco'
    fill_in 'backcountry_access', with: 'true'
    fill_in 'snowboarder_permitted', with: 'true'

    click_on 'Add Ski Resort'

    expect(current_path).to eq('/ski_resorts')
    expect(page).to have_content('Copper Mountain')
  end
end
