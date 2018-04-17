require './test/test_helper'
require './lib/file_loader'

class FileLoaderTest < Minitest::Test
  include FileLoader

  def setup
    path = './test/test_data/'
    filename = 'file_loader_test_data.csv'
    @parsed_data = load(path, filename)
    # require 'pry';binding.pry
    @thing1 = @parsed_data[0]
    @thing2 = @parsed_data[1]
  end

  def test_parsed_data_is_csv_table
    assert_instance_of CSV::Table, @parsed_data
  end

  def test_parsed_data_returns_elements_as_csv_rows
    assert_instance_of CSV::Row, @thing1
    assert_instance_of CSV::Row, @thing2
  end
end
