Feature: Japanese Mosaic logic puzzle

  The Japanese Mosaic logic puzzle is a derivative of the Nonogram puzzle form invented by 
  Tetsuya Nishio.
  It consists of a grid with the cells containing either the numbers 0 to 9 or nothing.
  The number in a cell tells you how many of itself and its neighbours are filled in.
  For our consideration we shall consider a filled in cell one with a # in it.
  
  A 0 in a cell means that none of the neighbour cells or itself can be filled in.
  If a 0 constraint contradicts another constraint the 0 constraint always takes priority.
  
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

  Scenario: '0' constraint cancelling out a '2' constraint
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
    |2|3|2|
    |3|4|3|
    |2|3|2|
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
    |3| | | |3|
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
