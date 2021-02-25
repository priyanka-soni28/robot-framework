*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/Resource1.robot

Suite Setup   launch browser
Suite Teardown   close all browsers

*** Test Cases ***
LoginAIQ
    title check
    login id and password
    click on login
    sleep  20
Handling popups
    close popup
    close popup2
    close popup3
Getting text japanese
    default
    selecting japanese language
    japanese text
    english characters- japanese
Current url
    ${get_url}   Get Location
    log to console  ${get_url}
    create file  ${EXECDIR}/example.txt  ${get_url}
Getting text chinese
    selecting chinese language
    chinese text
    english characters- chinese
Python files
    Executing python files
