class Partner < ApplicationRecord

  def self.agoda
    find_by(name: 'Agoda')
  end
end