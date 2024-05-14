*** Settings ***
Library  SeleniumLibrary
Resource  ../PO/login_page_mail.robot
Resource  ../PO/login_page_password.robot
Variables  ../Data/Configuration.yaml

*** Variables ***           
${valid_username}            bahadirbayazit.test@gmail.com
${valid_password}            amazon.test
${home_button}               nav-logo-sprites
${accounts_and_lists_tab}    nav-link-accountList-nav-line-1
${exit_button}               a[id='nav-item-signout'] span[class='nav-text']
${search_bar}                twotabsearchtextbox
${search_button}             nav-search-submit-button
${cart_button}               nav-cart-count-container
${delete_button}             //input[@data-action='delete']

${browser}  ${EMPTY}
*** Keywords ***
Open Amazon Browser
    [Documentation]
    ${browser_options} =  Evaluate  sys.modules['selenium.webdriver'].${browser}Options()  sys, selenium.webdriver
    Call Method  ${browser_options}  add_argument  --ignore-certificate-errors
    Call Method  ${browser_options}  add_argument  --ignore-ssl-errors
    ${options} =  Call Method  ${browser_options}  to_capabilities
    Open Browser  ${AMAZON.URL}  browser=${browser}  remote_url=http://selenium-hub:4444/wd/hub  desired_capabilities=${options}
    Maximize Browser Window
    Set Selenium Speed  0
    Set Selenium Timeout  5
    Set Selenium Implicit Wait  5

Default Test Setup
    [Documentation]  This keyword opens the browser and starts the session.
    log to console  DEFAULT TEST SETUP IS STARTED...
    Open Amazon Browser
    Login with test account
    log to console  DEFAULT TEST SETUP IS COMPLETED...

Default Test Teardown
    [Documentation]  Ends the session and closes the browser
#   Wait Until Element Is Visible  ${home_button}
#    click element  ${home_button}
#    Sleep  1
#    mouse over  ${accounts_and_lists_tab}
    #exit button cannot be found
#    Wait Until Element Is Visible  ${exit_button}
#    click element  ${exit_button}
    Close Browser

Login with test account
    [Tags]  SMOKE
    Allow Cookies for Amazon
    Enter mail address and continue  ${valid_username}
    Enter password and sign in  ${valid_password}

Allow Cookies for Amazon
      Run Keyword And Ignore Error  Click Element  sp-cc-accept
    
Search from search bar to
    [Documentation]  Search any text -> String from the search bar at any page
    [Arguments]  ${text}
    Wait Until Element Is Visible  ${search_bar}
    Input Text  ${search_bar}  ${text}
    Click Button  ${search_button}
    Sleep  1

Clear Chart
    [Documentation]  This keyword clears all products into the Cart
    Click Element  ${cart_button}
    FOR  ${_}  IN RANGE  100
        ${status}  Run Keyword And Return Status  Click Element  ${delete_button}
        exit for loop if  not ${status}
        Sleep  2
    END

Wait for the element
    [Arguments]  ${element}
    Wait Until Element Is Visible  ${element}  30
    