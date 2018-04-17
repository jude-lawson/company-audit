require './test/test_helper'
require './modules/date_handler'
require './lib/project'

class ProjectTest < Minitest::Test
  def setup
    project_id = '123'
    name = 'Widget Maker'
    start_date = '2015-01-01'
    end_date = '2018-01-01'
    @project = Project.new(project_id, name, start_date, end_date)
    @start_date = DateHandler.string_to_date(start_date)
    @end_date = DateHandler.string_to_date(end_date)
  end

  def test_project_exists
    assert_instance_of Project, @project
  end

  def test_attributes
    assert_equal Integer, @project.id.class
    assert_equal 123, @project.id
    assert_equal 'Widget Maker', @project.name
    assert_equal @start_date, @project.start_date
    assert_equal @end_date, @project.end_date
  end
end
