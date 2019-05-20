class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :username, :avatar, :created_at

  has_many :sightings
  has_many :animals, through: :sightings
  has_many :comments, :as => :commentable, dependent: :destroy


  def avatar
    rails_blob_path(object.avatar, only_path: true) if object.avatar.attached?
  end

end


