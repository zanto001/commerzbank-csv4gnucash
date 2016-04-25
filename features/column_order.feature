Feature: Column order
  
  As a user
  I want the CSV output columns to be
    Date
    Num
    Description
    Notes
    Account
    Deposit
    Withdrawal
    Balance
  So that I can tag the columns easily in the GnuCash import wizard
  
  Scenario: header and one line of data
    Given a file named "f.csv" with:
    """
    Buchungstag;Wertstellung;Umsatzart;Buchungstext;Betrag;Währung;Auftraggeberkonto;Bankleitzahl Auftraggeberkonto;IBAN Auftraggeberkonto
    22.04.2016;22.04.2016;Lastschrift;DANKE;-5,51;EUR;938471023;30041254;DE40432432456544324320
    """
    When I successfully run `commerzbank-csv4gnucash f.csv`
    Then column 1 in row 1 should be "20160422"
    And  column 2 in row 1 should be ""
    And  column 3 in row 1 should be "DANKE"
    And  column 4 in row 1 should be ""
    And  column 5 in row 1 should be "Commerzbank"
    And  column 6 in row 1 should be "-5.51"
    And  column 7 in row 1 should be ""
    And  column 8 in row 1 should be ""
  