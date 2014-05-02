class Goal < ActiveRecord::Base
  validates :title, :user_id, :public, presence: true

  belongs_to :user
end
