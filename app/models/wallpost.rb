# == Schema Information
#
# Table name: wallposts
#
#  id         :bigint(8)        not null, primary key
#  message    :text
#  user_id    :integer
#  custom_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Wallpost < ApplicationRecord

  belongs_to :user
  belongs_to :custom
end
