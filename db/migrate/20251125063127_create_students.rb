class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name,  null: false
      t.string :surname,    null: false
      t.references :school, null: false, foreign_key: { to_table: :uchi_schools }
      t.references :class, null: false, foreign_key: { to_table: :class_rooms }

      t.timestamps
    end
  end
end
