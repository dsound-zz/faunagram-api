class CommentSerializer < ActiveModel::Serializer

  attributes :id, :body, :user_id, :username, :created_at

  belongs_to :commentable, :polymorphic => true
  has_many :comments, as: :commentable, dependent: :destroy



end
