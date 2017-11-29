# == Schema Information
#
# Table name: wallposts
#
#  id         :integer          not null, primary key
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
