class Task < ActiveRecord::Base
  belongs_to :user

  scope :todo, where(:done => false)
  scope :done, where(:done => true)

  def done!
    self.update_attributes :done => true
  end
end
