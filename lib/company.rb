require './lib/file_loader'
require 'csv'

class Company
  include FileLoader

  attr_reader :employees,
              :projects,
              :timesheets

  def initialize
    @employees = []
    @projects = []
    @timesheets = []
  end

  def load_employees(filename)
    loaded = load('./data/', filename)
    if loaded.class == CSV::Table
      create_index(loaded, 'employees')
      return { success: true, error: nil}
    else
      return { success: false, error: loaded}
    end
  end

  def load_projects(filename)
    loaded = load('./data/', filename)
    if loaded.class == CSV::Table
      create_index(loaded, 'projects')
      return { success: true, error: nil}
    else
      return { success: false, error: loaded}
    end
  end

  def load_timesheets(filename)
    loaded = load('./data/', filename)
    if loaded.class == CSV::Table
      create_index(loaded, 'timesheets')
      return { success: true, error: nil}
    else
      return { success: false, error: loaded}
    end
  end
  
  def create_index(data, collection)
    lookup = {}
    data.each do |row|
      if collection == 'employees'
        lookup[row[:id].to_i] = Employee.new(row[:id], row[:name],
                                        row[:role], row[:start_date],
                                        row[:end_date])
      end
    end
    if collection == 'employees'
      @employees = lookup
    end
  end
end
