class Job < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :city, presence: true, length: { maximum: 10 }
  validates :company, presence: true, length: { maximum: 10 }
  validates :category, presence: true, length: { maximum: 10 }


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

  # Scope #
  scope :recent, -> { order("created_at DESC")}
  scope :published, -> { where(:is_hidden => false)}
  scope :random5, -> { limit(5).order("RANDOM()") }

end
