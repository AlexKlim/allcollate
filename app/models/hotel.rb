class Hotel < ApplicationRecord
  include Sluggable

  sluggable_from :name

  update_index('hotels') { self if active? } if Rails.env.production?

  belongs_to :brand, optional: true

  after_save :update_counter_cache
  after_destroy :update_counter_cache

  has_many :rates
  has_many :photos

  enum hotel_state: { active: 'active', draft: 'draft', pending: 'pending' }

  def self.latest_rates_between(start_rate, end_rate)
    joins(:rates).where('rates.actual_on >= ?', Date.today - 1.months)
                 .group('hotels.id', 'photos.id', 'rates.id')
                 .having('AVG(rates.daily_rate) BETWEEN ? and ?', start_rate, end_rate)
  end

  def self.latest_rates_more_than(rate)
    joins(:rates).where('rates.actual_on >= ?', Date.today - 1.months)
                 .group('hotels.id', 'photos.id', 'rates.id')
                 .having('AVG(rates.daily_rate) >= ?', rate)
  end

  def self.latest_rates_less_than(rate)
    joins(:rates).where('rates.actual_on >= ?', Date.today - 1.months)
                 .group('hotels.id', 'photos.id', 'rates.id')
                 .having('AVG(rates.daily_rate) <= ?', rate)
  end

  def self.ransackable_scopes(_auth_object = nil)
    %i[latest_rates_between latest_rates_more_than latest_rates_less_than]
  end

  def rate
    12
  end

  private

  def update_counter_cache
    brand.update_hotels_count
  end
end
