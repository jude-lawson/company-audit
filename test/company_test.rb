require './test/test_helper'
require './lib/company'
require './lib/employee'

class CompanyTest < Minitest::Test
  def setup
    @company = Company.new
    @employee1 = Employee.new('1','Susan Smith', 'Manager', '2016-01-01', '2018-02-20')
    @employee2 = Employee.new('2','John Smith', 'Engineer', '2016-01-01', '2018-02-20')
  end

  def test_company_exists
    assert_instance_of Company, @company
  end

  def test_company_begins_with_no_employees
    assert_equal [], @company.employees
  end

  def test_company_begins_with_no_projects
    assert_equal [], @company.projects
  end

  def test_company_begins_with_no_timesheets
    assert_equal [], @company.timesheets
  end

  def test_load_good_data_returns_correct_message
    expected = {success: true, error: nil}
    assert_equal expected, @company.load_employees('employees.csv')
    assert_equal expected, @company.load_projects('projects.csv')
    assert_equal expected, @company.load_timesheets('timesheets.csv')
  end

  def test_load_bad_data_returns_error
    expected = {success: false, error: 'bad_data'}
    assert_equal expected, @company.load_employees('bad_employees.csv')
    assert_equal expected, @company.load_projects('bad_projects.csv')
    assert_equal expected, @company.load_timesheets('bad_timesheets.csv')
  end

  def test_loading_in_employee_data_creates_lookup_table
    @company.load_employees('employees.csv')
    expected = { 1 => @employee1, 2 => @employee2 }
    assert_equal expected, @company.employees
  end
end
