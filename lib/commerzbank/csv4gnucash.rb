require 'commerzbank/csv4gnucash/version'
require 'csv'
require 'date'
require 'pp'

# Wrap a given stream and normalize line endings.
# Works for LF and CRLF line endings.
class LineEndingNormalizer
  def initialize(wrapped)
    @wrapped = wrapped
  end

  def gets(arg)
    raise "Expected #{"\n".inspect} but got #{arg.inspect}" unless arg == '\\n'

    line = @wrapped.gets
    line = line.chomp if line
    line
  end
end

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
      f.tr('.', '').tr(',', '.').to_f
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
    def self.with_csv_output(output)
      CSV(output) { |csv| yield csv }
    end

    def self.with_csv_input(input)
      CSV.new(LineEndingNormalizer.new(input),
              col_sep: ';',
              row_sep: '\n',
              headers: true,
              header_converters: :symbol,
              converters: %i[foo bar]).each do |row|
        yield row
      end
    end

    # rubocop:disable Metrics/MethodLength
    def self.convert(row)
      conv = []
      conv << row[:buchungstag]
      conv << nil
      conv << format('%<buchungstext>s [%<umsatzart>s]',
                     buchungstext: row[:buchungstext],
                     umsatzart: row[:umsatzart])
      conv << nil
      conv << 'Commerzbank'
      conv << row[:betrag]
      conv << nil
      conv << nil
      conv
    end
    # rubocop:enable Metrics/MethodLength

    def self.main(input)
      with_csv_output($stdout) do |out|
        with_csv_input(input) do |row|
          out << convert(row)
        end
      end
    end
  end
end
