*** Settings ***
Documentation    PO of the cart page
Library          SeleniumLibrary
Resource         generic.robot
Variables        ../locators/locators.py

*** Keywords ***
Clear Chart
    [Documentation]  This keyword clears all products into the Cart
    Wait Until Element Is Visible  ${remove_button}
    Click Button  ${remove_button}
    FOR  ${_}  IN RANGE  100
        ${status}  Run Keyword And Return Status  Click Button  ${remove_button}
        exit for loop if  not ${status}
        Sleep  2
    END

Check if item name contains
    [Documentation]  This keyword checks if the name added to cart contains the given value or not
    [Arguments]  ${given_text}
    Wait Until Element Is Visible  ${item_name}
    ${displayed_item_name}  Get Text  ${item_name}
    Should Contain  ${displayed_item_name}  ${given_text}  ignore_case=True