class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.sample
    all.sample
  end
end
