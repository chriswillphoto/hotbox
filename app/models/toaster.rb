# == Schema Information
#
# Table name: toasters
#
#  id           :integer          not null, primary key
#  model        :text
#  manufacturer :text
#  year         :integer
#  rating       :float            default(0.0)
#  ratings      :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  image        :text
#

class Toaster < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :collections
  has_many :customs
end
