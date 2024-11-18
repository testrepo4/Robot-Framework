*** Settings ***
Documentation   Resource keyword  is used to store all reusable things in one file
...     system specific keyword words are stored
Library     SeleniumLibrary

*** Variables ***
${browserClose}        Close Browser
${url}        https://rahulshettyacademy.com/loginpagePractise
${browserName}        chrome
${user_name}         rahulshettyacademy
${invalid_password}        123456
${valid_Password}    learning

*** Keywords ***
Open the browser with the mortgage payment url
    Open Browser    url=${url}      browser=${browserName}       options=add_experimental_option("detach",${True})

wait until element is visible in the page
    [Arguments]        ${page_locator}
    Wait Until Element Is Visible  ${page_locator}

Delete all Cookies After Closing the Browser
    Delete All Cookies

Close Browser Session
    Close Browser

