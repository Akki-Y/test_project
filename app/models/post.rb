class Post < ApplicationRecord
  
  validates :post_title, presence: true
  validates :post_description, presence: true
  after_save :send_email_notification

  def send_email_notification
    PostMailer.new_post_live(self).deliver!
  end
  
end
