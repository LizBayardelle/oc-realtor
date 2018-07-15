class Blog < ActiveRecord::Base
  # has_attached_file :image, default_url: "missing_blog_pic.jpg"
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_one_attached :image
  belongs_to :user
  has_one :pillar
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_taggable
  has_many :comments
  after_create :send_email


  def send_email
    User.where(blog_emails: true).each do |user|
      BlogMailer.new_blog(self, user).deliver_now
    end
  end
end
