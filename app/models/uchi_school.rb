class UchiSchool < ApplicationRecord
  has_many :classes, class_name: 'ClassRoom', dependent: :destroy, foreign_key: :school_id
  has_many :students, dependent: :destroy
end
