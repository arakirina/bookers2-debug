class UserRoom < ApplicationRecord
  
  # usersテーブルとroomsテーブルの中間テーブル。
  # 外部キーとしてuser_idとroom_idを持っている。

  belongs_to :user
  belongs_to :room

end
