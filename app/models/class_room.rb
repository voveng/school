class ClassRoom < ApplicationRecord
  belongs_to :school, class_name: "UchiSchool", foreign_key: "school_id"
end
