Feature: CRLF line terminators

  As a user
  I want that CRLF terminated input is accepted
  So that the original Commerzbank CSV file does not need to be changed

  Scenario: header and one line of data
    Given a file named "f.csv" with:
    """
    Buchungstag;Wertstellung;Umsatzart;Buchungstext;Betrag;Währung;Auftraggeberkonto;Bankleitzahl Auftraggeberkonto;IBAN Auftraggeberkonto
    22.04.2016;22.04.2016;Lastschrift;DANKE;-5,51;EUR;938471023;30041254;DE40432432456544324320
    """
    Given I convert "f.csv" to CRLF line terminators
    When I successfully run `commerzbank-csv4gnucash f.csv`
    Then column 1 in row 1 should be "20160422"
    And  column 2 in row 1 should be ""
    And  column 3 in row 1 should be "DANKE [Lastschrift]"
    And  column 4 in row 1 should be ""
    And  column 5 in row 1 should be "Commerzbank"
    And  column 6 in row 1 should be "-5.51"
    And  column 7 in row 1 should be ""
    And  column 8 in row 1 should be ""
