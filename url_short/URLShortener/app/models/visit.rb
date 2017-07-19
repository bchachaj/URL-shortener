class Visit < ActiveRecord::Base
  validates :user_id, :url_id, presence: true

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  belongs_to :url,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'ShortenedUrl'

  def self.record_visit!(user, shortened_url)
    Visit.create!(:user_id => user.id, :url_id => shortened_url.id)
  end
end
