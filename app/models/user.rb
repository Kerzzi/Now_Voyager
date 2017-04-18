class User < ApplicationRecord
  before_save { self.email = email.downcase }  #把 email 属性的值转换为小写形式，确保电子邮件地址的唯一性
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #使用正则表达式验证电子邮件地址的格式
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } #电子邮件地址唯一性验证，不区分大小写

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # 返回指定字符串的哈希摘要
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
                                                BCrypt::Password.create(string, cost: cost)
  end
end
