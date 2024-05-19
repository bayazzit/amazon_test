*** Settings ***
Documentation    PO of the products page
Library          SeleniumLibrary
Resource         generic.robot
Variables        ../locators/locators.py

*** Keywords ***
Get inside to backpack item
    [Documentation]  This keyword gets inside to the backpack item
    Click Element  ${backpack_item} 

Add item to cart
    [Documentation]  This keyword adds the item to cart
    Click button  ${add_to_cart_button}

Check if product title contains
    [Arguments]  ${given_title}
    ${product_title_text}  Get Text  ${product_title}
    Should Contain  ${product_title_text}  ${given_title}  ignore_case=True