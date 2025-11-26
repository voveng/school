# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data to ensure a clean state if run multiple times
Student.destroy_all
ClassRoom.destroy_all
UchiSchool.destroy_all

# Create Schools
school1 = UchiSchool.find_or_create_by!(name: 'Гимназия №1', address: 'ул. Пушкина, 10')
school2 = UchiSchool.find_or_create_by!(name: 'Лицей №5', address: 'пр. Ленина, 25')

puts "Создано #{UchiSchool.count} школ."

# Create ClassRooms for School 1
class1_1 = ClassRoom.find_or_create_by!(number: 10, letter: 'А', school_id: school1.id)
class1_2 = ClassRoom.find_or_create_by!(number: 10, letter: 'Б', school_id: school1.id)
class1_3 = ClassRoom.find_or_create_by!(number: 11, letter: 'А', school_id: school1.id)

# Create ClassRooms for School 2
class2_1 = ClassRoom.find_or_create_by!(number: 9, letter: 'В', school_id: school2.id)
class2_2 = ClassRoom.find_or_create_by!(number: 11, letter: 'Г', school_id: school2.id)

puts "Создано #{ClassRoom.count} классов."

# Create Students for ClassRoom 1_1 (School 1)
Student.find_or_create_by!(first_name: 'Иван', last_name: 'Иванов', surname: 'Иванович', school_id: school1.id,
                           class_id: class1_1.id)
Student.find_or_create_by!(first_name: 'Мария', last_name: 'Петрова', surname: 'Александровна', school_id: school1.id,
                           class_id: class1_1.id)
Student.find_or_create_by!(first_name: 'Алексей', last_name: 'Сидоров', surname: 'Дмитриевич', school_id: school1.id,
                           class_id: class1_1.id)

# Create Students for ClassRoom 1_2 (School 1)
Student.find_or_create_by!(first_name: 'Елена', last_name: 'Козлова', surname: 'Сергеевна', school_id: school1.id,
                           class_id: class1_2.id)
Student.find_or_create_by!(first_name: 'Дмитрий', last_name: 'Смирнов', surname: 'Олегович', school_id: school1.id,
                           class_id: class1_2.id)

# Create Students for ClassRoom 2_1 (School 2)
Student.find_or_create_by!(first_name: 'Анна', last_name: 'Федорова', surname: 'Игоревна', school_id: school2.id,
                           class_id: class2_1.id)
Student.find_or_create_by!(first_name: 'Сергей', last_name: 'Михайлов', surname: 'Павлович', school_id: school2.id,
                           class_id: class2_1.id)

puts "Создано #{Student.count} учеников."

ClassRoom.all.each do |class_room|
  ClassRoom.reset_counters(class_room.id, :students)
end

puts 'Счетчики учеников в классах обновлены.'
