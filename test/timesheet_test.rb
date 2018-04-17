require './test/test_helper'
require './modules/date_handler'
require './lib/timesheet'

class TimesheetTest < Minitest::Test
  def setup
    employee_id = '5'
    project_id = '7'
    date = '2015-01-01'
    minutes = '120'
    @timesheet = Timesheet.new(employee_id, project_id, date, minutes)
    @date = DateHandler.string_to_date(date)
  end

  def test_timesheet_exists
    assert_instance_of Timesheet, @timesheet
  end

  def test_timesheet_attributes
    assert_equal Integer, @timesheet.employee_id.class
    assert_equal Integer, @timesheet.project_id.class
    assert_equal 5, @timesheet.employee_id
    assert_equal 7, @timesheet.project_id
    assert_equal @date, @timesheet.date
    assert_equal Integer, @timesheet.minutes.class
    assert_equal 120, @timesheet.minutes
  end
end
