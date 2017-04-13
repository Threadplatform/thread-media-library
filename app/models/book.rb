class Book < ApplicationRecord
  belongs_to :user
  has_many :reviews, as: :reviewable

  def self.search search
	  if search
	    where(['LOWER(name) LIKE ? OR LOWER(author) LIKE ?', "%#{search.downcase}%",  "%#{search.downcase}%"])
	  else
	    all
	  end
  end
end
