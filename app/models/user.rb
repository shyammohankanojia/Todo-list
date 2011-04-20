class User < ActiveRecord::Base
  has_many :tasks

  attr_accessor :password_confirmation

  validates :login, :presence => true, :uniqueness => true

  with_options :if => :password_required? do |v|
    v.validates_presence_of :password
    v.validates_confirmation_of :password
    v.validates_length_of :password, :within => 6..20, :allow_blank => true
  end

  protected
  def password_required?
    !persisted? || !password.blank? || !password_confirmation.blank?
  end
end
