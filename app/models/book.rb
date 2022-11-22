class Book < ApplicationRecord
  # has_one_attached :profile_image
  
  # A19
  belongs_to :user
  
  # A46
  # ア・２＞21章＞バリテーションを設定する
  validates :title, presence: true
  
  validates :body,
  length: { minimum: 1, maximum: 200 }
end
