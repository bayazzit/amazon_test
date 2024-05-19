*** Settings ***
Documentation  This test case aims to test if a product can be added to the cart
Library  SeleniumLibrary
Suite Setup  Default Test Setup
Suite Teardown  Default Test Teardown
Resource  ../keywords/generic.robot

*** Test Cases ***
Add a Product to the Cart
    # Get the item
    Get inside to backpack item
    Check if product title contains  backpack
    # Add item to cart and check
    Add item to cart
    Go to cart
    Check if item name contains  backpack