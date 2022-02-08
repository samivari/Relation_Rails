require 'rails_helper'

RSpec.describe 'ski resort edit' do
  it 'I can update a ski resort' do # 12
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')

    visit "/ski_resorts/#{keystone.id}"

    click_link 'Update'

    expect(current_path).to eq("/ski_resorts/#{keystone.id}/edit")

    fill_in 'name', with: 'Keystone Resort'
    fill_in 'lifts', with: '22'
    fill_in 'employee', with: '2000'
    fill_in 'altitude', with: '12_000'
    fill_in 'avg_snowfall', with: '33'
    fill_in 'Location', with: 'Frisco'
    fill_in 'backcountry_access', with: 'true'
    fill_in 'snowboarder_permitted', with: 'true'

    click_on 'Update Ski Resort'

    expect(current_path).to eq("/ski_resorts/#{keystone.id}")
    expect(page).to have_content('Keystone Resort')
  end
end
