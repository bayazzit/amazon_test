*** Settings ***
Documentation  Login Test
Library  SeleniumLibrary
Suite Setup  Default Test Setup
Suite Teardown  Default Test Teardown
Resource  ../PO/generic.robot
Resource  ../PO/login_page_mail.robot
Resource  ../PO/login_page_password.robot
Resource  ../PO/main_page.robot
Resource  ../PO/searched_products_page.robot
Resource  ../PO/product_page.robot

*** Test Cases ***
Add a Product to the Cart
    # Allow cookies
    Allow Cookies for Amazon
    # Actual test
    Search from search bar to  microsoft arc mouse
    Select the first product
    Check if product title contains  microsoft
    Check if product title contains  arc
    Add to cart
    # Postcondition
    Clear Chart
