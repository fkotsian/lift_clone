class Goal < ActiveRecord::Base
  validates :title, :user_id, presence: true
  # validates :public, presence: true

  belongs_to :user
end
