require 'commerzbank/csv4gnucash/version'

module Commerzbank
  # Csv4gnucash adopts Commerzbank CSV for GnuCash
  module Csv4gnucash
    def self.main(input)
      input.readline
      begin
        puts input.readline
      rescue EOFError => e
        puts e
      end
    end
  end
end
