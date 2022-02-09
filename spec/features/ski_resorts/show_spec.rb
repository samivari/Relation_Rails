require 'rails_helper'

RSpec.describe 'ski resort show' do
  it 'shows the ski resorts name and other attributes' do # user story 2
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

  it 'shows the ski runs associated to the ski resort' do
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
    schoolmarm = keystone.ski_runs.create!(name: 'schoolmarm', open: true, distance: 3, green: true, blue: false,
                                           black: false, condition: 'groomed')
    noodle_soup = keystone.ski_runs.create!(name: 'noodle soup', open: false, distance: 2, green: false, blue: false,
                                            black: true, condition: 'groomed')

    visit "/ski_resorts/#{keystone.id}"

    expect(page).to have_content(keystone.count_runs)
  end

  it 'has a link to all ski runs' do
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
    visit "/ski_resorts/#{keystone.id}"
    click_link 'All Ski Runs'
    expect(current_path).to eq('/ski_runs')
  end

  it 'has a link to all ski resorts' do
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
    visit "/ski_resorts/#{keystone.id}"
    click_link 'All Ski Resorts'
    expect(current_path).to eq('/ski_resorts')
  end

  it 'has a link to the ski resorts ski runs' do
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
    visit "/ski_resorts/#{keystone.id}"
    click_link 'Ski Runs at Keystone'
    expect(current_path).to eq("/ski_resorts/#{keystone.id}/ski_runs")
  end

  it 'I can update a ski resort' do # 12
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')

    visit "/ski_resorts/#{keystone.id}"

    click_link 'Update'

    expect(current_path).to eq("/ski_resorts/#{keystone.id}/edit")

    fill_in 'Name', with: 'Keystone Resort'

    click_on 'Update Ski Resort'

    expect(current_path).to eq("/ski_resorts/#{keystone.id}")
    expect(page).to have_content('Keystone Resort')
  end
end
