class Video < ApplicationRecord
  def self.search search
	  if search
	    where(['name LIKE ? OR source LIKE ?', "%#{search}%",  "%#{search}%"])
	  else
	    all
	  end
  end
end
