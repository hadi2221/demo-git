*** Settings ***
Documentation  This is some basic information about the whole suite
Resource  ../Resources/Amazon.robot
Resource  ../Resources/Common.robot
Library  Dialogs

Suite Setup  Insert Testing Data
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test
Suite Teardown  Cleanup Testing Data


*** Variables ***
${BROWSER} =  gc
${START_URL} =  http://www.amazon.com
${SEARCH_TERM} =  Ferrari 458

*** Test Cases ***
#User can search for products
#    [Documentation]  This is some basic info about the test
#    [Tags]  Smoke
#
#    Amazon.Search for products
#
#User Must sign in to check out
#    [Documentation]  This is some basic info about the test
#    [Tags]  Smoke
#
#    Amazon.Search for products
#    Amazon.Select Product from Search Results
#    Amazon.Add product to Cart
#    #Amazon.Begin Checkout

Logged out user can search for products
    [Tags]  Web
    ${new_browser} =  Get Selection From User  Which browser?  chrome  ie
    Set Global variable  ${BROWSER}  ${new_browser}
    Amazon.Search for products

Logged out user can add product to cart
    [Tags]  Web
    Amazon.Search for Products
    Execute Manual Step  Do Something manually!  It failed!
    Pause Execution
    Amazon.Add Product to Cart