class Blog < ActiveRecord::Base
  # has_attached_file :image, default_url: "missing_blog_pic.jpg"
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_one_attached :image
  has_many_attached :pins
  belongs_to :user
  belongs_to :resource, optional: true
  has_one :pillar
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_taggable
  has_many :comments
  after_create :send_email


  def send_email
    Subscriber.all.each do |subscriber|
      if subscriber.tag_string.include? 'interest-blog'
        BlogMailer.new_blog(self, subscriber).deliver_now
      end
    end
  end

end
