# == Schema Information
#
# Table name: customs
#
#  id          :integer          not null, primary key
#  name        :text
#  image       :text
#  user_id     :text
#  toaster_id  :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

class Custom < ApplicationRecord
  belongs_to :user
  belongs_to :toaster
end
