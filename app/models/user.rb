class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :user_image

  def profile_image
    unless user_image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.jpg')
      user_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    user_image
  end

  has_many :cats, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries
  has_many :reports, as: :reportable
  has_many :notifications, as: :notifiable, dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  # フォローする、したの関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  # 一覧画面表示用
  has_many :following, through: :relationships, source: :following
  has_many :followers, through: :reverse_relationships, source: :follower

  # バリデーション
  validates :username, presence: true, uniqueness: true, length: { minimum: 6 }
  validates :email, presence: true
  # validates :password, presence: true, length: { minimum: 8 } これ死ぬぞ
  validate :password_must_contain_letter

  def password_must_contain_letter
    return if password.blank?
    unless password.match?(/[a-zA-Z]/)
      errors.add(:password, 'は少なくとも一つのアルファベットを含む必要があります')
    end
  end

  # ゲストログイン機能
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = "GuestUser"
    end
  end

  # フォロー処理
  def follow(user)
    relationships.create(following_id: user.id)
  end
  # アンフォロー処理
  def unfollow(user)
    relationships.find_by(following_id: user.id).destroy
  end
  # フォロー確認
  def following?(user)
    following.include?(user)
  end

  def mutual_follow?(user)
    self.following?(user) && user.following?(self)
  end

end