require 'csv'

module FileLoader
  def load(path, filename)
    CSV.read("#{path}#{filename}", headers: :true, header_converters: :symbol)
  end    
end
