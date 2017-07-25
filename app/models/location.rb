class Location < ApplicationRecord
	belongs_to :user
	has_many :friends, through: :user

  scope :my_locations, lambda { |id|
    select('coordinates').where(user_id: id)
  }

  scope :my_friends_locations, lambda { |id|
    find_by_sql("SELECT l.coordinates FROM locations l where l.user_id in(SELECT f.friend_id FROM friends f where f.user_id = #{id} )")
  }

  def self.public_locations 
    select('coordinates').where(share_type: 'Public')
  end
end
