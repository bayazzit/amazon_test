*** Settings ***
Documentation    PO of the login page
Library          SeleniumLibrary
Resource         generic.robot
Variables        ../locators/locators.py

*** Keywords ***
Login with standard account
    [Documentation]  This keyword logins with standard user account
    Input Text  ${mail_box}  ${valid_username}
    Input Text  ${password_box}  ${valid_password}
    Click Button  ${login_button}