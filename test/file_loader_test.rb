require './test/test_helper'
require './lib/file_loader'

class FileLoaderTest < Minitest::Test

  def setup
    path = './test/test_data/'
    filename = 'file_loader_test_data.csv'
    @parsed_data = FileLoader.load(path, filename)
    @thing1 = @parsed_data[1]
    @thing2 = @parsed_data[2]
  end

  def test_parsed_data_is_csv_object
    assert_instance_of CSV, @parsed_data
  end

  def test_parsed_data_returns_correct_elements
    assert_equal 
  end
end
