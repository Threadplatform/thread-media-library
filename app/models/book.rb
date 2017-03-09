class Book < ApplicationRecord
  belongs_to :user

  def self.search search
	  if search
	    where(['name LIKE ? OR author LIKE ?', "%#{search}%",  "%#{search}%"])
	  else
	    all
	  end
  end
end
