Feature: Comma as delimiter
  
    Scenario: header and one line of data
    Given a file named "f.csv" with:
    """
    Buchungstag;Wertstellung;Umsatzart;Buchungstext;Betrag;Währung;Auftraggeberkonto;Bankleitzahl Auftraggeberkonto;IBAN Auftraggeberkonto
    22.04.2016;22.04.2016;Lastschrift;DANKE;-5,51;EUR;938471023;30041254;DE40432432456544324320
    """
    When I successfully run `commerzbank-csv4gnucash f.csv`
    Then the output should not contain ";"
    Then the output should contain ","
