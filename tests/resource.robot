*** Settings ***
Documentation        A resource.robot file in Robot Framework is a resource file containing reusable 
...                  and variables that can be imported into test suites or other resource files. 
...                  allows you to define common functionality once and reuse it across multiple test cases 
...                  or test suites, promoting modularity and reducing duplication in your test automation code.

# ... means You can split the statement into two lines using the continuation character (...).
Library        SeleniumLibrary


*** Variables ***
${user_name}                binayks143@yahoo.com
${invalid_password}         Binay123
${valid_password}           Binay123@
${url}                      https://www.letskodeit.com/login


*** Keywords ***
Open the Browser with URL
    Open Browser    ${url}    chrome   #Using driver manager
    Maximize Browser Window


Close Browser Session
    Close Browser