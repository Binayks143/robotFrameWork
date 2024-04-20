##parameterize test cases
#while doing parameterize test cases need to decleared Test Template and test template key should be available in keywords


*** Settings ***
Documentation    To Validate the Login Form
Library          SeleniumLibrary
Library          Collections
Test Setup       open the Browser with URL        # if this is not availabe in current file then it will search in resource file
Test Teardown    Close Browser Session
Resource         resource.robot
Test Template    Validate UnSuccessful Login


#global variable
*** Variables ***
${Login_Error_Message}        css:.error
${Login_Successful}           css:.zl-navbar-rhs-img

*** Test Cases ***        username        password
Invalid UserName        abc123@yahoo.com       Binay123@
Invalid Password        binayks143@yahoo.com        HARIhh@
Special Character        @&jhjjh                @099#



*** Keywords ***

Validate UnSuccessful Login
    [Arguments]        ${username}    ${password}
    Fill the login form        ${username}        ${password}
    wait until element is visible on web page   ${Login_Error_Message}
    verify the error message

Fill the login form
    [arguments]    ${username}    ${password}
    Input Text        name:email           ${username}     #name:email  locator:locator name
    Input Text        id:login-password    ${password}
    Click Button      login                            #By default locator type will be id
    
    
wait until element is visible on web page
    [arguments]    ${element}
    Wait Until Element Is Visible    ${element} 


verify the error message
    ${result}=    Get Text    ${Login_Error_Message}
    #getting the text from locator using css and string in result local variable
    Should Be Equal As Strings    ${result}    Incorrect login details. Please try again.     #doing assertion
    #or
    Element Text Should Be    ${Login_Error_Message}    Incorrect login details. Please try again.