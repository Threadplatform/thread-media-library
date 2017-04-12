class Video < ApplicationRecord
  belongs_to :user
  has_many :reviews, as: :reviewable

  def self.search search
	  if search
	    where(['name LIKE ? OR source LIKE ?', "%#{search}%",  "%#{search}%"])
	  else
	    all
	  end
  end
end
