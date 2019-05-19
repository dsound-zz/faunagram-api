class Sighting < ApplicationRecord

  has_one_attached :image, dependent: :destroy

  belongs_to :user
  belongs_to :animal
  has_many :comments, :as => :commentable, dependent: :destroy

  def image_filename
    self.image.filename.to_s if self.image.attached?
  end

  def image_attached?
    self.image.attached?
  end

  def attachment_url
    if self.attachment.attached?
      Rails.application.routes.url_helpers.rails_blob_url(self.attachement, only_path: false)
    else
      nil
    end
  end


end
