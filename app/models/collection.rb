class Collection < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy

  def upvotes
    votes.sum(:upvote)
  end

  def downvotes
    votes.sum(:downvote)
  end

end
