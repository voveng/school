# frozen_string_literal: true

class ResetStudentsCountForClassRooms < ActiveRecord::Migration[7.1]
  def up
    ClassRoom.all.each do |class_room|
      ClassRoom.reset_counters(class_room.id, :students)
    end
  end

  def down
    # No need to reverse this migration
  end
end
