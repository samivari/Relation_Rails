class SkiResort < ApplicationRecord
  has_many :ski_runs, dependent: :destroy

  validates_presence_of :name,
                        :lifts,
                        :employee,
                        :altitude,
                        :avg_snowfall,
                        :location

  validates :backcountry_access, inclusion: [true, false]
  validates :snowboarder_permitted, inclusion: [true, false]

  def self.sorted
    order(created_at: :desc)
  end

  def count_runs
    SkiRun.where(ski_resort_id: id).count
  end
end
