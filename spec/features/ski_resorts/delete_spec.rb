require 'rails_helper'

RSpec.describe 'delete' do
  it 'can delete a resort' do # 20
    SkiResort.destroy_all
    keystone = SkiResort.create!(name: 'Keystone', lifts: 20, backcountry_access: true, employee: 30_000,
                                 snowboarder_permitted: true, altitude: 9280, avg_snowfall: 235, location: 'Summit County')
    noodle_soup = keystone.ski_runs.create!(name: 'noodle soup', open: false, distance: 2, green: false, blue: false,
                                            black: true, condition: 'groomed')
    visit "/ski_resorts/#{keystone.id}"

    click_link 'Delete'

    expect(current_path).to eq('/ski_resorts')
    expect(page).to_not have_content(keystone.name)
  end
end
