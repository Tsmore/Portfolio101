class Post < ApplicationRecord

  default_scope { order(created_at: :desc) }

  has_many_attached :post_image

  belongs_to :user

  has_many :bookmarks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reports, as: :reportable
  has_many :notifications, as: :notifiable, dependent: :destroy
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships


  validates :title, presence: true
  validates :body, presence: true


  # タグ機能

  # Tagオブジェクトの名前を取得し(反復処理でname属性を取得)半角スペースで連結し文字として返す
  def tag_list
    tags.map(&:name).join(' ')
  end
  # 上記のメソッドの文字列を受け取り個別のタグとして分解しPostモデルに関連付け
  def tag_list=(tags_string)
    # tag_stringを半角全角スペースで分割、uniqメソッドで重複を排除、mapメソッド使用
    tag_names = tags_string.split(/[\s\u3000]+/).uniq
    # find_or_create_by(name: name)で各タグ名に対応するTagオブジェクトを取得or新規作成
    new_or_found_tags = tag_names.map { |name| Tag.find_or_create_by(name: name) }
    # ここで処理したタグをPostオブジェクトに関連付け
    self.tags = new_or_found_tags
  end

  # いいね機能

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # ブックマーク機能

  def find_bookmark(user)
    bookmarks.find_by(user_id: user.id)
  end


end
