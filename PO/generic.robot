*** Settings ***
Library  SeleniumLibrary
Resource  cart_page.robot
Resource  login_page.robot
Resource  products_page.robot
Variables  ../data/Configuration.yaml

*** Variables ***           
${browser}  ${EMPTY}
${tags}  ${EMPTY}

*** Keywords ***
Open Saucedemo Browser
    [Documentation]
    ${browser_options} =  Evaluate  sys.modules['selenium.webdriver'].${browser}Options()  sys, selenium.webdriver
    Call Method  ${browser_options}  add_argument  --ignore-certificate-errors
    Call Method  ${browser_options}  add_argument  --ignore-ssl-errors
    Call Method  ${browser_options}  add_argument  --disable-gpu
    Call Method  ${browser_options}  add_argument  --no-sandbox
    Call Method  ${browser_options}  add_argument  --disable-setuid-sandbox
    Call Method  ${browser_options}  add_argument  --disable-dev-shm-usage
    Call Method  ${browser_options}  add_argument  --start-maximized
    #${options} =  Call Method  ${browser_options}  to_capabilities
    Open Browser  ${SAUCEDEMO.URL}  browser=${browser}  remote_url=http://selenium-hub:4444/wd/hub  options=${browser_options}
    Maximize Browser Window
    Set Selenium Speed  0
    Set Selenium Timeout  5
    Set Selenium Implicit Wait  5

Default Test Setup
    [Documentation]  This keyword opens the browser and starts the session.
    log to console  DEFAULT TEST SETUP IS STARTED...
    Open Saucedemo Browser
    Login with standard account
    log to console  DEFAULT TEST SETUP IS COMPLETED...

Default Test Teardown
    [Documentation]  Ends the session and closes the browsers
    log to console  DEFAULT TEST TEARDOWN IS STARTED...
    Go to cart
    Clear Chart
    Close All Browsers
    log to console  DEFAULT TEST TEARDOWN IS COMPLETED...
    
Go to cart
    [Documentation]  This keyword goes to cart
    Click Element  ${go_to_cart}
    