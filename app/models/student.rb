class Student < ApplicationRecord
  belongs_to :school, class_name: 'UchiSchool'
  belongs_to :class_room, class_name: 'ClassRoom', foreign_key: :class_id, counter_cache: true
  validates :first_name, :last_name, :surname, :school_id, :class_id,
            presence: true

  validates :first_name, :last_name, :surname,
            length: { minimum: 1, maximum: 50 }

  validates :school_id, :class_id,
            numericality: { only_integer: true, greater_than: 0 }
end
