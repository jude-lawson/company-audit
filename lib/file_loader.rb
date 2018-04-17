require 'csv'

module FileLoader
  def load(path, filename)
    data = CSV.read("#{path}#{filename}", headers: :true, header_converters: :symbol)
    check_for_nil(data)
  end
  
  def check_for_nil(data)
    data.each do |row|
      h = row.to_hash
      values = h.values.all?
      fields = h.keys.all?
      if values && fields
        data
      else
        'bad_data'
      end 
    end
  end
end
