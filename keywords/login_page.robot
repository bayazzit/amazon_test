*** Settings ***
Documentation    PO of the login page
Library          SeleniumLibrary
Resource         generic.robot
Variables        ../locators/locators.py

*** Keywords ***
Login with standard account
    [Documentation]  This keyword logins with standard user account
    Wait Until Element Is Visible  ${mail_box}  30 s
    Input Text  ${mail_box}  ${valid_username}
    Wait Until Element Is Visible  ${password_box}  30 s
    Input Text  ${password_box}  ${valid_password}
    Wait Until Element Is Visible  ${login_button}  30 s
    Click Button  ${login_button}