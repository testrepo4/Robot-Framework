*** Settings ***
Documentation    All the page Objects and Keywords of Landing page
Library     SeleniumLibrary
Resource    Generic.robot

*** Variables ***

${Login_Validation_Error_Message}        css:.alert-danger

*** Keywords ***
Fill Login Form
    [arguments]        ${username}       ${password}
    Input Text        id:username         ${username}
    Input password    id:password         ${password}
    Click Button      signInBtn

wait until element is visible in the page
    Wait Until Element Is Visible  ${Login_Validation_Error_Message}

   #First Testcase
Verify error message is correct
     ${result}=       Get Text     ${Login_Validation_Error_Message}
     Should Be Equal As Strings        ${result}        Incorrect username/password.
     Element Text Should Be       ${Login_Validation_Error_Message}      Incorrect username/password.

    #Third Testcase
Fill the Login Details and Login Form
    Input Text        id:username        rahulshettyacademy
    Input Password    id:password        learning
    Click Element    xpath://input[@value='user']
    Wait Until Element Is Visible    xpath://div[@class='modal-body']
    Click Button    okayBtn
    Click Button    okayBtn
    Select From List By Value       css:select.form-control        teach
    Select Checkbox        terms
    Checkbox Should Be Selected           terms
    Unselect Checkbox        terms
    Checkbox Should Not Be Selected     terms