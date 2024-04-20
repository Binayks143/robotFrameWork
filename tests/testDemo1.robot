*** Settings ***
Documentation    To Validate the Login Form
Library    SeleniumLibrary
Test Teardown    Close Browser   #execute at the last of all the test cases

#global variable
*** Variables ***
${Login_Error_Message}    css:.error

*** Test Cases ***
Validate UnSuccessful Login
    Open the Browser with URL
    Fill the login form
    wait until it checks and display the error message
    verify the error message


*** Keywords ***
Open the Browser with URL
    Open Browser    https://www.letskodeit.com/login    chrome   #Using driver manager
    Maximize Browser Window

Fill the login form
    Input Text    name:email    binayks143@yahoo.com     #name:email  locator:locator name
    Input Text    id:login-password    Binay123
    Click Button    login                            #By default locator type will be id
    
wait until it checks and display the error message
    Wait Until Element Is Visible    ${Login_Error_Message}
    
    
verify the error message
    ${result}=    Get Text    ${Login_Error_Message}     #getting the text from locator using css and storing in result local variable
    Should Be Equal As Strings    ${result}    Incorrect login details. Please try again.     #doing assertion
    #or
    Element Text Should Be    ${Login_Error_Message}    Incorrect login details. Please try again.
