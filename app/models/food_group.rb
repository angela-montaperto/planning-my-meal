class FoodGroup < ApplicationRecord
  validates :group_name, :name, :code, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[group_name name code]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
