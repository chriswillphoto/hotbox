# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  title      :text
#  body       :text
#  user_id    :integer
#  toaster_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  rating     :integer
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :toaster
end
