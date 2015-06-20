module CourseAssignmentHelper
  def create_assignment_and_course_assignment_route(course_id)
    "/courses/#{course_id}/create_assignment_and_course_assignment/new"
  end
end
