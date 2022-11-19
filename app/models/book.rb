class Book < ApplicationRecord
  has_one_attached :image
  
  # A19
  belongs_to :user
  
  # A46
  # ア・２＞21章＞バリテーションを設定する
  validates :title, presence: true
  validates :body, presence: true
end
