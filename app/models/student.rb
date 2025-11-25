class Student < ApplicationRecord
  belongs_to :school, class_name: 'UchiSchool'
  belongs_to :class_room, class_name: 'ClassRoom'
end
