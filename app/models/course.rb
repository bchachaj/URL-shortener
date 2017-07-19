class Course < ActiveRecord::Base
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: 'Enrollment'

  has_many :enrolled_students, :through => :enrollments, :source => :student

  has_many :child_courses,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: 'Course'

  belongs_to :prereqs,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: 'Course'

  belongs_to :instructor,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: 'User'

end
