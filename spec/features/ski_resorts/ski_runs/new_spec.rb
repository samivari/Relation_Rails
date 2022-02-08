require 'rails_helper'

RSpec.describe 'ski resorts ski runs new' do
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
