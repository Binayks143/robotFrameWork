*** Settings ***
Documentation    Element Practice Page Experiment
Library    SeleniumLibrary
Library    Collections
Test Setup        Open the Browser with URL
Test Teardown     Close Browser Session
Resource    resource.robot


*** Test Cases ***
Navigate to practice Page and perform actions
    click on PRACTICE tab
    click on element practice option from dropdown

Switched to child window
    click on PRACTICE tab
    click on element practice option from dropdown
    switch to child window
    verify the switched to child window

Perform the action on child window
    click on PRACTICE tab
    click on element practice option from dropdown
    switch to child window
    verify the switched to child window
    Click on radio button    benz
    Select all the checkboxes
    Open the new window
    Switch Back to main window
    Select the value from dropdown    honda
    Select Multiple option
    Auto Suggestion example



*** Keywords ***
click on PRACTICE tab
    Click Link    PRACTICE

click on element practice option from dropdown
    Click Link    Element Practice

switch to child window
    Switch Window        New
    Log Title

verify the switched to child window
    Element Text Should Be    css:h1        Practice Page
    ${original_window}=    Get Window Handles
    Set Global Variable    ${original_window}                #declaring global variable
    Log    ${original_window}

Click on radio button
    [arguments]        ${radioSelection}
    Click Element        xpath://input[@value='${radioSelection}' and @type='radio']

Select all the checkboxes
    @{listelement}=    Get Webelements    xpath://input[@type='checkbox' and @name='cars']
    Log    ${listelement}
    FOR    ${element}    IN    @{listelement}
        Log    ${element}
        Sleep    1
        Select Checkbox                ${element}
        Checkbox Should Be Selected    ${element}
    END

Open the new window
    Click Element    id:openwindow
    Switch Window    NEW
    Log Title
    Title Should Be    All Courses

Switch Back to main window
    Switch Window    ${original_window}[1]
    Log Title

Select the value from dropdown
    [arguments]        ${givenDropDownValue}
    Select From List By Value    id:carselect     ${givenDropDownValue}
    Sleep    2


Select Multiple option
    ${multiSelectDropdown}=    Get Webelement    id:multiple-select-example
     Select From List By Value    ${multiSelectDropdown}    orange       peach
     Sleep    2

Auto Suggestion example
    Input Text    autosuggest    app
    Sleep    4
    Wait Until Element Is Visible    autosuggest    timeout=10
    Sleep    5

     



      


