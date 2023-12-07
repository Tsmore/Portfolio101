class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cats, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :reports, as: :reportable
  # フォローする、したの関係性
  has_many :followers, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  # 一覧画面表示用
  has_many :follower_users, through: :followings, source: :following
  has_many :following_users, through: :followers, source: :follower

  # ゲストログイン機能
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = "GuestUser"
    end
  end

  # フォロー処理
  def follow
    followers.create(following_id: user_id)
  end
  # アンフォロー処理
  def unfollow
    followers.find_by(following_id: user_id).destroy
  end
  # フォロー確認
  def following?
    following_users.include?(user)
  end

end