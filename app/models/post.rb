class Post < ActiveRecord::Base
  validates :body, presence: true, length: { maximum: 140 }

  def character_count
    return body.length
  end
end
