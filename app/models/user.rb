class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, :surname, :email, :role, presence: true
  validates :password, :password_confirmation, presence: true, on: :create

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


end
