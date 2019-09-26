*** Settings ***
Library  Selenium2Library
Resource  ../Resources/PO/LandingPage.robot
Resource  ../Resources/PO/TopNav.robot
Resource  ../Resources/PO/SearchResults.robot
*** Keywords ***

Search for products
    LandingPage.Load
    LandingPage.Verify Page Loaded
    TopNav.Search for products
    SearchResults.Verify Search Completed
    #Input Text  id=twotabsearchtextbox  usb cable
    #Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    #Wait Until Page Contains  results for "usb cable"

Select Product from Search Results
    SearchResults.Click Product Link
    Wait Until Page Contains  Back to results

Add product to Cart
    Click Button  id=add-to-cart-button
    Wait Until Page Contains  Added to Cart

Begin Checkout
    Click Link  Proceed to checkout (1 item)
    Click Link  No Thanks
    Page Should Contain Element  ap_signinia_pagelet_title
    Element Text Should Be  ap_signinia_pagelet_title  Sign In

