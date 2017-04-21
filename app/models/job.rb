class Job < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :company, presence: true
  validates :category, presence: true


  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  belongs_to :user, required: false
  # 如果user_id 不填会一直报错rollback transaction网上查找发现, require: false 可以解决
  has_many :posts
  has_many :resumes
  has_many :job_relationships
  has_many :members, through: :job_relationships, source: :user

  # scope :recent, -> { order("created_at DESC")}
  # scope :published, -> { where(:is_hidden => false)}

end
