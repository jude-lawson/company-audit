require './test/test_helper'
require './lib/company'

class CompanyTest < Minitest::Test
  def setup
    @company = Company.new
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
end
