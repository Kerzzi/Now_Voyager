class Resume < ApplicationRecord
  validates :content, presence: { message: "请填写简历描述" }
  validates :attachment, presence: { message: "请选择简历文档" }

  belongs_to :user
  belongs_to :job

  mount_uploader :attachment, AttachmentUploader

  scope :recent, -> { order('created_at DESC') }

end
