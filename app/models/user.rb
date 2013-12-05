class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.find_for_vkontakte_oauth access_token
    if user = User.where(:url => access_token.info.urls.Vkontakte).first
      user
    else 
      User.create!(:provider => access_token.provider, :url => access_token.info.urls.Vkontakte, :email => access_token.extra.raw_info.screen_name+'@vk.com', :password => Devise.friendly_token[0,20]) 
    end
  end

end
