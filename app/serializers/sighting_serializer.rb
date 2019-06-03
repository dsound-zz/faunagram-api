class SightingSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :body, :likes, :image, :created_at, :user_id, :animal_name

  belongs_to :user
  belongs_to :animal
  has_many :comments, :as => :commentable, dependent: :destroy



  # this gives a custom attribute from Animal model
  def animal_name
    Animal.find_by(id: object.animal_id ).gname
  end

  def image
  rails_blob_path(object.image, only_path: true) if object.image.attached?
  end

end
