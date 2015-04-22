class Tutorial < ActiveRecord::Base
  
  belongs_to :user
=begin
 # for sunspot
  searchable do
		text :title, :boost => 2
		text :description  	
  end
=end
  def self.search(query)
    where("description like ? or title like ?", "%#{query}%", "%#{query}%")
  end
end
