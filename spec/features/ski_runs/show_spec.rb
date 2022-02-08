require 'rails_helper'

RSpec.describe 'ski run show' do
  it 'shows the ski run name and other attributes' do # user story 4
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
    schoolmarm = keystone.ski_runs.create!(name: 'schoolmarm', open: true, distance: 3, green: true, blue: false,
                                           black: false, condition: 'groomed')
    noodle_soup = keystone.ski_runs.create!(name: 'noodle soup', open: false, distance: 2, green: false, blue: false,
                                            black: true, condition: 'groomed')

    visit "/ski_runs/#{noodle_soup.id}"

    expect(page).to have_content(noodle_soup.name.titleize)
    expect(page).to have_content(noodle_soup.open)
    expect(page).to have_content(noodle_soup.distance)
    expect(page).to have_content(noodle_soup.green)
    expect(page).to have_content(noodle_soup.blue)
    expect(page).to have_content(noodle_soup.black)
    expect(page).to have_content(noodle_soup.condition)
    expect(page).to_not have_content(schoolmarm.name)
  end

  it 'has a link to all ski runs' do
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
    noodle_soup = keystone.ski_runs.create!(name: 'noodle soup', open: false, distance: 2, green: false, blue: false,
                                            black: true, condition: 'groomed')
    visit "/ski_runs/#{noodle_soup.id}"
    click_link 'All Ski Runs'
    expect(current_path).to eq('/ski_runs')
  end

  it 'has a link to all ski resorts' do
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
    noodle_soup = keystone.ski_runs.create!(name: 'noodle soup', open: false, distance: 2, green: false, blue: false,
                                            black: true, condition: 'groomed')
    visit "/ski_runs/#{noodle_soup.id}"
    click_link 'All Ski Resorts'
    expect(current_path).to eq('/ski_resorts')
  end

  it 'has a form to update a new ski run' do # 14
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
    noodle_soup = keystone.ski_runs.create!(name: 'noodle soup', open: false, distance: 2, green: false, blue: false,
                                            black: true, condition: 'groomed')
    visit "/ski_runs/#{noodle_soup.id}"

    click_link 'Update'

    expect(current_path).to eq("/ski_runs/#{noodle_soup.id}/edit")

    fill_in 'name', with: 'Noodle'

    click_on 'Update Ski Run'

    expect(current_path).to eq("/ski_runs/#{noodle_soup.id}")
    expect(page).to have_content('Noodle')
  end
end
