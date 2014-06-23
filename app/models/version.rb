class Version < ActiveRecord::Base
<<<<<<< HEAD
	include PublicActivity::Model
	tracked owner: ->(controller, model) {controller && controller.current_user }

  belongs_to :piece
=======
  belongs_to :user
>>>>>>> 28ee5a03e90e922dc0213ecb2cfb3d6a8a46c372
end
