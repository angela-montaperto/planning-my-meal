class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  audited only: %i[name surname email active role
    privacy confirmed_at unconfirmed_email locked_at
  ]

  attr_accessor :privacy

  validates :name, :surname, :email, :role, presence: true
  validates :password, :password_confirmation, presence: true, on: :create
  validates :privacy, acceptance: true, on: :create
  validate :privacy_check, on: :create

  def admin?
     role == Role::ADMIN
  end

  def user?
     role == Role::USER
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[active email surname name]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def privacy_check
    errors.add(:privacy, :accepted) unless (@privacy.presence || "0") == "1"
  end
end
