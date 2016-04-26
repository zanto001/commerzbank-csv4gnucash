require 'spec_helper'

module Commerzbank
  describe Csv4gnucash do
    it 'has a version number' do
      expect(Csv4gnucash::VERSION).not_to be nil
    end

    # describe '.convert_date' do
    #   it 'should reverse the order' do
    #     expect(Csv4gnucash.convert_date('23.12.2014')).to eq('20141223')
    #   end

    #   it 'should show a leading zero for day' do
    #     expect(Csv4gnucash.convert_date('3.12.2014')).to eq('20141203')
    #   end

    #   it 'should show a leading zero for month' do
    #     expect(Csv4gnucash.convert_date('23.2.2014')).to eq('20140223')
    #   end
    # end
  end
end
