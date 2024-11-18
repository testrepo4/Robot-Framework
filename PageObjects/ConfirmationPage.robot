*** Settings ***
Documentation    All Page Objects and Keywords of Confirmation page
Library    SeleniumLibrary


*** Variables ***
${country_name} =    xpath://a[text()='India']
${Checkbox_locator} =    xpath://label[@for='checkbox2']
${purchase_name} =     xpath://input[@value='Purchase']
${Payment_success_Expected_message} =    Success!
${Success_text_locator} =    //div[@class='alert alert-success alert-dismissible']

*** Keywords ***

Enter Country and select the checkbox
    
   [Arguments]    ${country_name}

   Input Text    country    ${country_name}
   Wait Until Element Is Visible    xpath://a[text()='${country_name}']    10s
   Click Element        xpath://a[text()='${country_name}']
   Wait Until Element Is Visible     ${Checkbox_locator}
   Click Element    ${Checkbox_locator}

Purchase the product and confirm the purchase is successful
   Click Button   ${purchase_name}
   Page Should Contain    ${Payment_success_Expected_message}

