class User < ApplicationRecord
  has_many :permissaos, inverse_of: :user
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


         accepts_nested_attributes_for :permissaos, :reject_if => :all_blank, :allow_destroy => true
end
