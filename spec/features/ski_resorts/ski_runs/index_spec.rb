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

    within("#runs-#{schoolmarm.id}") do # with-in block tests
      expect(page).to have_content(schoolmarm.name.titleize)
      expect(page).to have_content(schoolmarm.open)
      expect(page).to have_content(schoolmarm.distance)
      expect(page).to have_content(schoolmarm.green)
      expect(page).to have_content(schoolmarm.blue)
      expect(page).to have_content(schoolmarm.black)
      expect(page).to have_content(schoolmarm.condition)
    end
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

  it 'has a link to all ski resorts' do
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
    noodle_soup = keystone.ski_runs.create!(name: 'noodle soup', open: false, distance: 2, green: false, blue: false,
                                            black: true, condition: 'groomed')
    visit "/ski_resorts/#{keystone.id}/ski_runs"
    click_link 'All Ski Resorts'
    expect(current_path).to eq('/ski_resorts')
  end

  it 'has a form to create a new ski run for the ski resort' do # 13
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
    visit "/ski_resorts/#{keystone.id}/ski_runs"

    click_link 'New Ski Run'

    expect(current_path).to eq("/ski_resorts/#{keystone.id}/ski_runs/new")

    fill_in 'name', with: 'Sunbeam'
    fill_in 'open', with: 'true'
    fill_in 'distance', with: '2'
    fill_in 'condition', with: 'snow packed'
    fill_in 'green', with: 'false'
    fill_in 'blue', with: 'false'
    fill_in 'black', with: 'true'

    click_on 'Add Ski Run'

    expect(current_path).to eq("/ski_resorts/#{keystone.id}/ski_runs")
    expect(page).to have_content('Sunbeam')
  end
end
