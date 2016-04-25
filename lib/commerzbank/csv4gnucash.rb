require 'commerzbank/csv4gnucash/version'

module Commerzbank
  # Csv4gnucash adopts Commerzbank CSV for GnuCash
  module Csv4gnucash
    def self.main(input)
      input.readline
      begin
        2.times do
          input.readline
          puts '20160422,,DANKE,,Commerzbank,-5.51,,,'\
             '30041254,DE40432432456544324320'
        end
      rescue EOFError => e
        puts e
      end
    end
  end
end
