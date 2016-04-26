require 'commerzbank/csv4gnucash/version'
require 'csv'
require 'date'
require 'pp'

CSV::Converters[:foo] =
  lambda do |f|
    if f =~ /^\d{1,2}\.\d{1,2}\.\d{4}$/
      Date.new(*f.split('.').map(&:to_i).reverse)
    else
      f
    end
  end

CSV::Converters[:bar] =
  lambda do |f|
    if f =~ /^-?[\d,.]+$/
      # TODO: avoid floats
      f.tr(',', '.').to_f
    else
      f
    end
  end

# Change Date format
class Date
  def to_s
    strftime('%Y%m%d')
  end
end

# Change Float format
class Float
  def to_s
    format('%.2f', self)
  end
end

module Commerzbank
  # Csv4gnucash adopts Commerzbank CSV for GnuCash
  module Csv4gnucash
    def self.convert(row)
      conv = []
      conv << row[:buchungstag]
      conv << nil
      conv << format('%s [%s]', row[:buchungstext], row[:umsatzart])
      conv << nil
      conv << 'Commerzbank'
      conv << row[:betrag]
      conv << nil
      conv << nil
      conv
    end

    def self.main(_input)
      CSV($stdout) do |out|
        CSV.new(ARGF,
                col_sep: ';',
                headers: true,
                header_converters: :symbol,
                converters: [:foo, :bar]
               ).each do |row|
          out << convert(row)
        end
      end
    end
  end
end
