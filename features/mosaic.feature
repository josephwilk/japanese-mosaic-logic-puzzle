Feature: Japanese Mosaic logic puzzle

  The Japanese Mosaic logic puzzle is a derivative of the Nonogram puzzle form invented by 
  Tetsuya Nishio.
  It consists of a grid with the cells containing either the numbers 0 to 9 or nothing.
  The number in a cell tells you how many of itself and its neighbours are filled in. 
  For our consideration we shall consider a filled in cell one with a # in it.
  The puzzle is complete when you have filled in all the squares that the constraints allow.

  Scenario: Empty grid
    Given a file named "start_grid" with:
    """
    | | | |
    | | | |
    | | | |
    """
    When I run mosaic start_grid
    Then the output should contain exactly:
    """
    | | | |
    | | | |
    | | | |
    
    """

  Scenario: Corner cell
    Given a file named "start_grid" with:
    """
    |4| | |
    | | | |
    | | | |
    """
    When I run mosaic start_grid
    Then the output should contain exactly:
    """
    |#|#| |
    |#|#| |
    | | | |
    
    """

  Scenario: Centre cell
    Given a file named "start_grid" with:
    """
    | | | |
    | |9| |
    | | | |
    
    """
    When I run mosaic start_grid
    Then the output should contain exactly:
    """
    |#|#|#|
    |#|#|#|
    |#|#|#|
    
    """

  Scenario: Side cell
    Given a file named "start_grid" with:
    """
    | | | |
    |6| | |
    | | | |
    """
    When I run mosaic start_grid
    Then the output should contain exactly:
    """
    |#|#| |
    |#|#| |
    |#|#| |
    
    """

  Scenario: 0 overriding a numeric cell
    Given a file named "start_grid" with:
    """
    |0| | |
    |2| |3|
    |0| | |
    """
    When I run mosaic start_grid
    Then the output should contain exactly:
    """
    | | |#|
    | | |#|
    | | |#|
    
    """

  Scenario: 3x3 grid with multiple cells
    Given a file named "start_grid" with:
    """
    |2| |2|
    | |4| |
    |2| |2|
    """
    When I run mosaic start_grid
    Then the output should contain exactly:
    """
    | |#| |
    |#| |#|
    | |#| |
    
    """

  Scenario: Easy 5x5 grid
    Given a file named "start_grid" with:
    """
    | | | | |1|
    | |9| | | |
    | |8|8| | |
    | | | | |4|
    |4| |5| |2|
    """
    When I run mosaic start_grid
    Then the output should contain exactly:
    """
    |#|#|#| | |
    |#|#|#|#| |
    |#|#|#|#|#|
    |#|#| |#| |
    |#|#|#|#| |
    
    """

  Scenario: Hard 5x5 grid
    Given a file named "start_grid" with:
    """
    |0| |4|4| |
    | |4| |6| |
    |3| |7|6| |
    | |6| |6|5|
    | | | | |3|
    """
    When I run mosaic start_grid
    Then the output should contain exactly:
    """
    | | |#|#| |
    | | |#|#| |
    |#|#| |#|#|
    | |#|#|#| |
    |#|#| |#|#|
    
    """
