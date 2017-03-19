class Word < ActiveRecord::Base

  def self.search(search)
    where("sentence LIKE ?", "%#{search}%")
    # where("description LIKE ?", "%#{search}%")
  end

end
