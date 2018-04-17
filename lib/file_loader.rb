require 'csv'

module FileLoader
  def load(path, filename)
    data = CSV.read("#{path}#{filename}", headers: :true, header_converters: :symbol)
    all_attributes = data.map do |row|
      h = row.to_hash
      h.values + h.keys
    end.flatten
    return 'bad_data' if all_attributes.any?(&:nil?)
    return data
  end
end
