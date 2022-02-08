require 'rails_helper'

RSpec.describe 'ski resort new' do
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
