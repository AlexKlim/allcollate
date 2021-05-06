class Hotel < ApplicationRecord
  include Sluggable

  sluggable_from :name

  belongs_to :brand, optional: true

  has_many :rates
  has_many :photos

  enum hotel_state: { active: 'active', draft: 'draft' }

  def self.latest_rates_between(start_rate, end_rate)
    joins(:rates).where('rates.created_at >= ?', Date.today - 1.months)
                 .group('hotels.id', 'photos.id', 'rates.id')
                 .having('AVG(rates.daily_rate) BETWEEN ? and ?', start_rate, end_rate)
  end

  def self.ransackable_scopes(_auth_object = nil)
    %i[latest_rates_between]
  end
end
