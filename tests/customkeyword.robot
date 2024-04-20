*** Settings ***
Documentation    custom keyword pratice
Library    SeleniumLibrary
Library    Collections
Test Setup        Open the Browser with URL
Test Teardown     Close Browser Session
Resource    resource.robot
Library        ../customLibraries/custom1.py            # importing custom method from another directory


*** Test Cases ***
Navigate to practice Page and perform actions
    click on PRACTICE tab
    click on element practice option from dropdown
    Hello World                #comming from custom1.py file


*** Keywords ***
click on PRACTICE tab
    Click Link    PRACTICE

click on element practice option from dropdown
    Click Link    Element Practice


