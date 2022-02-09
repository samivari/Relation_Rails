require 'rails_helper'

RSpec.describe 'ski resort edit' do
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

  it 'I can update a ski resort on the index page' do # 17
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')

    visit '/ski_resorts'

    within("#ski-resort-#{keystone.id}") do
      click_link 'Update'
    end

    expect(current_path).to eq("/ski_resorts/#{keystone.id}/edit")

    fill_in 'Name', with: 'Keystone Resort'

    click_on 'Update Ski Resort'

    expect(current_path).to eq("/ski_resorts/#{keystone.id}")
    expect(page).to have_content('Keystone Resort')
  end
end
