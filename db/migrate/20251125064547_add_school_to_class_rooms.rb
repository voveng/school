class AddSchoolToClassRooms < ActiveRecord::Migration[8.0]
  def change
    add_reference :class_rooms, :school, null: false, foreign_key: { to_table: :uchi_schools }
  end
end
