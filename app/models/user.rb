class User < ApplicationRecord
  has_many :collections
  has_many :votes

  def self.create_with_omniauth(auth)
    user = find_or_create_by(uid: auth[‘uid’], provider:  auth[‘provider’])
    user.email = “#{auth[‘uid’]}@#{auth[‘provider’]}.com”
    user.password = auth[‘uid’]
    user.name = auth[‘info’][‘name’]
    if User.exists?(user)
      user
    else
      user.save!
      user
    end
  end

  def owns_collection?(collection)
    self == collection.user
  end

  def upvote(collection)
    votes.create(upvote: 1, collection: collection)
  end

  def upvoted?(collection)
    votes.exists?(upvote: 1, collection: collection)
  end

  def remove_vote(collection)
    votes.find_by(collection: collection).destroy
  end

  def downvote(collection)
    votes.create(downvote: 1, collection: collection)
  end

  def downvoted?(collection)
    votes.exists?(downvote: 1, collection: collection)
  end

end
