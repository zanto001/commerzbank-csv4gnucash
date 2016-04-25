require 'commerzbank/csv4gnucash/version'
require 'csv'
require 'pp'

module Commerzbank
  # Csv4gnucash adopts Commerzbank CSV for GnuCash
  module Csv4gnucash
    def self.main(input)
      input.readline
      begin
        2.times do
          c = CSV.parse(input.readline, col_sep: ';')[0][4].tr(',', '.').to_f
          puts "20160422,,DANKE,,Commerzbank,#{format('%.2f', c)},,,"\
             '30041254,DE40432432456544324320'
        end
      rescue EOFError => e
        puts e
      end
    end
  end
end
