Feature: empty columns
  TODO merge this feature with column_order
  Some columns are expected to be empty
  2 Num
  4 Notes
  7 Withdrawal
  8 Balance

  Scenario: header and one line of data
    Given a file named "f.csv" with:
    """
    Buchungstag;Wertstellung;Umsatzart;Buchungstext;Betrag;Währung;Auftraggeberkonto;Bankleitzahl Auftraggeberkonto;IBAN Auftraggeberkonto
    22.04.2016;22.04.2016;Lastschrift;DANKE;-5,51;EUR;938471023;30041254;DE40432432456544324320
    """
    When I successfully run `commerzbank-csv4gnucash f.csv`
    Then column 2 in row 1 should be ""
    And  column 4 in row 1 should be ""
    And  column 7 in row 1 should be ""
    And  column 8 in row 1 should be ""
