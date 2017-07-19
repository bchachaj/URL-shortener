class ShortenedUrl < ActiveRecord::Base
  validates :short_url, :long_url, presence: true, uniqueness: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  has_many :views,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'Visit'

  has_many :visitors,
    Proc.new { distinct},
    through: :views,
    source: :user


  def num_clicks
    views.length
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques
    visitors.where("created_at > ?", 10.minutes.ago).count
  end


  def self.url_factory(user, long_url)
    ShortenedUrl.create!(:long_url => long_url, :short_url => self.random_code, :user_id => user.id)
  end

  def self.random_code
    code = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(:short_url => code)
      code = SecureRandom.urlsafe_base64
    end
    code
  end
end
