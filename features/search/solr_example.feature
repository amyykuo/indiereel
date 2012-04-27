#Feature: Solr Works
#  In order to serve up search pages
#  Our system must have a working search index

#  Scenario Outline: Search
#    Given the solr URL <url> 
#    When I search for <term>
#    Then I should see <count> results
#    And it should take <time> milliseconds

#    Examples:
#      | url | term | count | time |
#      | http://localhost:8983/solr | generic post | over 5 | under 250 |
#      | http://localhost:8983/solr | lkjasdlkjasd post | under 1 | under 250 |
