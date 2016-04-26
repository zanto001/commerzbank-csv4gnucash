Feature: Date format

  As a user
  I want dates to be displayed as y-m-d (ex. 20140317)
  So that GnuCash will important them without tweaking settings in the
  import wizard

  Scenario Outline: header and one line of data
    Given a file named "f.csv" with:
    """
    Buchungstag;Wertstellung;Umsatzart;Buchungstext;Betrag;Währung;Auftraggeberkonto;Bankleitzahl Auftraggeberkonto;IBAN Auftraggeberkonto
    <in>;22.04.2016;Lastschrift;DANKE;-5,33;EUR;938471023;30041254;DE40432432456544324320
    """
    When I successfully run `commerzbank-csv4gnucash f.csv`
    Then column 1 in row 1 should be "<out>"

    Examples: no leading zeros
      | in            |  out      |
      | 23.12.2014    | 20141223  |
      | 23.12.2214    | 22141223  |

    Examples: day with leading zero
      | in            |  out      |
      | 01.12.2014    | 20141201  |
      | 1.12.2014    | 20141201  |
