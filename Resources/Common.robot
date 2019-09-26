*** Settings ***
Library  Selenium2Library

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}

End Web Test
    Close Browser

Insert Testing Data
    Log  I am setting up the test data...

Cleanup Testing Data
    Log  I am cleanin up the test data...