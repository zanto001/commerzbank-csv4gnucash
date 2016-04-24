require "commerzbank/csv4gnucash/version"

module Commerzbank
  module Csv4gnucash
    def self.main(input)
      input.readline
      begin
        puts input.readline
      rescue
      end
    end
  end
end
