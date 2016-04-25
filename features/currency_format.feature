Feature: Currency format
  
  As a user
  I want currencies to be displayed with period
  So that GnuCash will important them without tweaking settings in the
  import wizard
  
  Scenario Outline: header and one line of data
    Given a file named "f.csv" with:
    """
    Buchungstag;Wertstellung;Umsatzart;Buchungstext;Betrag;Währung;Auftraggeberkonto;Bankleitzahl Auftraggeberkonto;IBAN Auftraggeberkonto
    22.04.2016;22.04.2016;Lastschrift;DANKE;<in>;EUR;938471023;30041254;DE40432432456544324320
    """
    When I successfully run `commerzbank-csv4gnucash f.csv`
    Then column 6 in row 1 should be "<out>"

    Examples: zero
      | in   |  out |
      | 0    | 0.00 |
      | 0,00 | 0.00 |

    Examples: small positive integer
      |   in |   out |
      |    3 |  3.00 |
      | 3,00 |  3.00 |
      |   10 | 10.00 |
      |   17 | 17.00 |

    Examples: large positive integer
      |        in |          out |
      |     10000 |     10000.00 |
      | 123456789 | 123456789.00 |

    Examples: small negative integer
      |    in |    out |
      |    -3 |  -3.00 |
      | -3,00 |  -3.00 |
      |   -10 | -10.00 |
      |   -17 | -17.00 |

    Examples: large negative integer
      |         in |           out |
      |     -10000 |     -10000.00 |
      | -123456789 | -123456789.00 |

    Examples: small positive float
      | in    |   out |
      | 3,13  |  3.13 |
      | 3,13  |  3.13 |
      | 10,13 | 10.13 |
      | 17,13 | 17.13 |

    Examples: large positive float
      | in           |          out |
      | 10000,13     |     10000.13 |
      | 123456789,13 | 123456789.13 |

    Examples: small negative float
      | in     |    out |
      | -3,13  |  -3.13 |
      | -3,13  |  -3.13 |
      | -10,13 | -10.13 |
      | -17,13 | -17.13 |

    Examples: large negative float
      | in            |           out |
      | -10000,13     |     -10000.13 |
      | -123456789,13 | -123456789.13 |
