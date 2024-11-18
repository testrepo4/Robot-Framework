*** Settings ***
Documentation    All the  page objects and keywords of Shop page
Library    SeleniumLibrary
Library        Collections
Resource   Generic.robot

*** Variables ***
${shop_page_load}         css: h1[class='my-4']
${text}                   xpath: //h1[@class='my-4']

*** Keywords ***

wait until element is visible in the page
    Wait Until Element Is Visible  ${shop_page_load}

verify Login is successfully and home page display
    Element Text Should Be          ${text}    Shop Name

verify card titles in the shop page

    @{expectedList} =    Create List        iphone X      Samsung Note 8        Nokia Edge       Blackberry
    ${elements} =    Get WebElements        css:.card-title
    @{actualList} =  Create List
    FOR    ${element}    IN    @{elements}
    Log    ${element.text}
    Append To List           ${actualList}     ${element.text}
    END
    Lists Should Be Equal      ${expectedList}        ${actualList}

Select the card
    [arguments]    ${cardName}
    ${elements} =  Get WebElements    css:.card-title
    ${index} =        Set Variable    1
    FOR    ${element}    IN    @{elements}
          Exit For Loop If     '${cardName}' == '${element.text}'
          ${index} =     Evaluate    ${index} + 1
    END
    Click Button        xpath:(//*[@class ='card-footer'])[${index}]/button


