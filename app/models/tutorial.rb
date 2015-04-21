class Tutorial < ActiveRecord::Base
  
  belongs_to :user

  searchable do
		text :title, :boost => 2
		text :description  	
  end
end
