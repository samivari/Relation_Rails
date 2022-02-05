class SkiRun < ApplicationRecord
  belongs_to :ski_resort

  validates_presence_of :name,
                        :distance,
                        :condition

  validates :open, inclusion: [true, false]
  validates :green, inclusion: [true, false]
  validates :blue, inclusion: [true, false]
  validates :black, inclusion: [true, false]
end
