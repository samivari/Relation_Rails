class SkiRun < ApplicationRecord
  belongs_to :ski_resort

  validates_presence_of :name,
                        :distance,
                        :condition

  validates :open, inclusion: [true, false]
  validates :green, inclusion: [true, false]
  validates :blue, inclusion: [true, false]
  validates :black, inclusion: [true, false]

  def self.is_open
    where(open: true)
  end

  def self.greater_than(num)
    where('distance > ?', num)
  end
end
