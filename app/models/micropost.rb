class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader  #在 Micropost 模型中添加图像上传程序
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  validate  :picture_size

  private

    # 验证上传的图像大小
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
