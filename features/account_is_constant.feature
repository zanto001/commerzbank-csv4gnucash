Feature: Account should be set to a constant
  
  As a user
  I want that account is set to a constant
  So that GnuCash matches the bank account for all transactions automatically
  
  Scenario: header and one line of data
    Given a file named "f.csv" with:
    """
    Buchungstag;Wertstellung;Umsatzart;Buchungstext;Betrag;Währung;Auftraggeberkonto;Bankleitzahl Auftraggeberkonto;IBAN Auftraggeberkonto
    22.04.2016;22.04.2016;Lastschrift;DANKE;-5,51;EUR;938471023;30041254;DE40432432456544324320
    """
    When I successfully run `commerzbank-csv4gnucash f.csv`
    Then column 5 in row 1 should be "Commerzbank"

  Scenario: header and two lines of data
    Given a file named "f.csv" with:
    """
    Buchungstag;Wertstellung;Umsatzart;Buchungstext;Betrag;Währung;Auftraggeberkonto;Bankleitzahl Auftraggeberkonto;IBAN Auftraggeberkonto
    22.04.2016;22.04.2016;Lastschrift;DANKE;-5,51;EUR;938471023;30041254;DE40432432456544324320
    23.04.2016;23.04.2016;Lastschrift;DANKE;-5,51;EUR;938471023;30041254;DE40432432456544324320
    """
    When I successfully run `commerzbank-csv4gnucash f.csv`
    Then column 5 in row 1 should be "Commerzbank"
    Then column 5 in row 2 should be "Commerzbank"
