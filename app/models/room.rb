class Room < ApplicationRecord

  has_many :chats
  has_many :user_rooms
  # 1つのルームにいるユーザ数は２人だからhas_manyになる

end
