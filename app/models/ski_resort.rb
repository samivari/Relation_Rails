class SkiResort < ApplicationRecord
  has_many :ski_runs

  validates_presence_of :name,
                        :lifts,
                        :employee,
                        :altitude,
                        :avg_snowfall,
                        :location

  validates :backcountry_access, inclusion: [true, false]
  validates :snowboarder_permitted, inclusion: [true, false]
end
