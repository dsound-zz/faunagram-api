class User < ApplicationRecord
    include Rails.application.routes.url_helpers

    has_secure_password
    has_one_attached :avatar, dependent: :destroy

  
    validates :username, uniqueness: true
    validates :password, presence: true, length: { minimum: 5 }

    has_many :sightings, dependent: :destroy
    has_many :animals, through: :sightings
    has_many :comments, :as => :commentable, dependent: :destroy


  def avatar_filename
    self.avatar.filename.to_s if self.avatar.attached?
  end

  def avatar_attached?
    self.avatar.attached?
  end


  def attachment_url
    if self.attachment.attached?
      Rails.application.routes.url_helpers.rails_blob_url(self.attachement, only_path: false)
    else
      nil
    end
  end

end
