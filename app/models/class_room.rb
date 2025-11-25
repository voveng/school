class ClassRoom < ApplicationRecord
  belongs_to :school, class_name: 'UchiSchool'

  has_many :students, dependent: :destroy, inverse_of: :class_room
end
