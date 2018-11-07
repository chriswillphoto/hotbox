# == Schema Information
#
# Table name: favourites
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :text
#

class Favourite < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :customs
end
