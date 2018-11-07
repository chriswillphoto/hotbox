# == Schema Information
#
# Table name: toasters
#
#  id           :bigint(8)        not null, primary key
#  model        :text
#  manufacturer :text
#  year         :integer
#  rating       :float            default(0.0)
#  ratings      :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  image        :text
#  score        :float            default(0.0)
#  description  :text
#

class Toaster < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :collections
  has_many :customs
end
