require 'test_helper'

class ClassRoomTest < ActiveSupport::TestCase
  test 'students_count is updated when a student is added or removed' do
    school = uchi_schools(:one)
    class_room = ClassRoom.create!(number: 1, letter: 'A', school: school)

    assert_equal 0, class_room.students_count

    student = Student.create!(
      first_name: 'John',
      last_name: 'Doe',
      surname: 'Smith',
      school: school,
      class_room: class_room
    )

    assert_equal 1, class_room.reload.students_count

    student.destroy

    assert_equal 0, class_room.reload.students_count
  end
end
