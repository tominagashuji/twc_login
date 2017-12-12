class User < ApplicationRecord
# 存在性の確認（presence）
	validates :name, presence: true
	validates :email, presence: true

# 長さの確認（presence）
	validates :name,  presence: true, length: { maximum: 30 }
	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

# メアドを小文字にして制約をかけている
	before_save { email.downcase! }

# パスワードのハッシュ化（登録フォームの作成）
	has_secure_password

# パスワードのバリデーション（６文字以上を設定）
	validates :password, presence: true, length: { minimum: 6 }

end