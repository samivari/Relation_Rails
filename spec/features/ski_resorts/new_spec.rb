require 'rails_helper'

RSpec.describe 'ski resort new' do
  it 'has a form to create a new ski resort' do
    visit '/ski_resorts'

    click_link 'New Ski Resort'

    expect(current_path).to eq('/ski_resorts/new')

    fill_in 'ski_resort_name', with: 'Copper Mountain'
    fill_in 'ski_resort_lifts', with: '22'
    fill_in 'ski_resort_employee', with: '2000'
    fill_in 'ski_resort_altitude', with: '12_000'
    fill_in 'ski_resort_avg_snowfall', with: '33'
    fill_in 'ski_resort_location', with: 'Frisco'
    fill_in 'ski_resort_backcountry_access', with: 'true'
    fill_in 'ski_resort_snowboarder_permitted', with: 'true'

    click_on 'Add Ski Resort'

    expect(current_path).to eq('/ski_resorts')
    expect(page).to have_content('Copper Mountain')
  end
end
