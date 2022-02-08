require 'rails_helper'

RSpec.describe 'ski run edit' do
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
