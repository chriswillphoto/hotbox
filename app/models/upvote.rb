# == Schema Information
#
# Table name: upvotes
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  custom_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Upvote < ApplicationRecord
  belongs_to :user
  belongs_to :custom
end
