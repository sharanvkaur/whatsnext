class Collection < ApplicationRecord
  belongs_to :user
  has_many :votes, :dependent => :delete_all

  def upvotes
    votes.sum(:upvote)
  end

  def downvotes
    votes.sum(:downvote)
  end

  def calc_points
    points = upvotes - downvotes

    update_attributes(points: points)
  end

end
