class CreateClassRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :class_rooms do |t|
      t.integer :number, null: false
      t.string :letter, null: false
      t.integer :students_count, null: false, default: 0

      t.timestamps
    end
  end
end
