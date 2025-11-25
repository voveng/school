class ClassRoom < ApplicationRecord
  belongs_to :school, class_name: 'UchiSchool'

  has_many :students, dependent: :destroy
end
