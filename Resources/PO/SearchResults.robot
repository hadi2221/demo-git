*** Settings ***
Library  Selenium2Library

*** Keywords ***
Verify Search Completed
    Wait Until Page Contains  results for "${SEARCH_TERM}"


Click Product Link
    [Documentation]  Clicks on the first product in the search result
    Click Element  //span[@class="a-size-base-plus a-color-base a-text-normal"]