class Api::UsersController < ApiController
    include RESTFramework::ModelControllerMixin
     has_many :posts, dependent: :destroy
  
     validates :username, presence: true, uniqueness: true
  end