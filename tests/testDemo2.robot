*** Settings ***
Documentation    To Validate the Login Form
Library          SeleniumLibrary
Library          Collections
Test Setup       open the Browser with URL        # if this is not availabe in current file then it will search in resource file
Test Teardown    Close Browser Session
Resource         resource.robot

#global variable
*** Variables ***
${Login_Error_Message}        css:.error
${Login_Successful}           css:.zl-navbar-rhs-img


*** Test Cases ***
Validate UnSuccessful Login
    Fill the login form    ${user_name}    ${invalid_password}
    wait until element is visible on web page   ${Login_Error_Message}
    verify the error message


Validate Successful Login
    Fill the login form    ${user_name}    ${valid_password}
    wait until element is visible    ${Login_Successful}


Click on All courses Link after Successful Login
    Fill the login form    ${user_name}    ${valid_password}
    wait until element is visible    ${Login_Successful}
    click on all courses link


verify the available courses title present
    Fill the login form    ${user_name}    ${valid_password}
    wait until element is visible    ${Login_Successful}
    click on all courses link
    verify the available courses title present


Click on specific course Link after Successful Login
    Fill the login form    ${user_name}    ${valid_password}
    wait until element is visible    ${Login_Successful}
    click on all courses link
    click on specific course link        Selenium WebDriver 4 With Python


*** Keywords ***
Fill the login form
    [arguments]    ${username}    ${password}             #This arguments will come from  test cases Fill the login form
    # if here 2 arguments given then same arguments shuld be declared in calling function
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


click on all courses link
    Click Link    xpath://a[contains(text(),"ALL COURSES")]            #clicking the all courses link

verify the available courses title present
    #Storing all the expected list in a variable
    @{expected_result}=    Create List    Cypress.io Test Automation    JavaScript for beginners    
    ...    Complete Test Automation Bundle    Selenium WebDriver 4 With Python
    ...    Selenium WebDriver Advanced    Rest API Automation With Rest Assured

    # @{ } use for creating the list only one time we have give ${} while accessing
    @{resultsLocators}=    Get Webelements    xpath://h4[@class='dynamic-heading']
    @{actualList}=    Create List

    FOR    ${element}    IN    @{resultsLocators}
        Log    ${element.text}
        Append To List    ${actualList}    ${element.text}
    END

    Lists Should Be Equal    ${expected_result}    ${actualList}
    
    
click on specific course link
    #using generic way
    [arguments]            ${courseName}    #course name=Selenium WebDriver 4 With Python
    @{resultsLocators}=    Get Webelements    xpath://h4[@class='dynamic-heading']
    ${index}=    Set Variable    1
    FOR    ${element}    IN    @{resultsLocators}
        Exit For Loop If    '${element.text}' == '${courseName}'
        ${index}=    Evaluate    ${index} + 1
    END
    Click Element            xpath:(//h4[@class='dynamic-heading'])[${Se}]
    


    