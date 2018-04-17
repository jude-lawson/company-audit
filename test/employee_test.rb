require './test/test_helper'
require './modules/date_handler'
require './lib/employee'

class EmployeeTest < Minitest::Test
  def setup
    employee_id = '5'
    name = 'Sally Sparrow'
    role = 'Engineer'
    start_date = '2015-01-01'
    end_date = '2018-01-01'
    @employee = Employee.new(employee_id, name, role, start_date, end_date)
    @start_date = DateHandler.string_to_date(start_date)
  end
  def test_instantiation
    assert_instance_of Employee, @employee
  end

  def test_attributes
    assert_equal Integer, @employee.id.class
    assert_equal 5, @employee.id
    assert_equal 'Sally Sparrow', @employee.name
    assert_equal 'Engineer', @employee.role
    assert_equal 
  end
end
