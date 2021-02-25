*** Settings ***
Library  SeleniumLibrary
Library  String
Library  OperatingSystem
Library  Process

*** Variables ***
${url}  https://aiq.netapp.com/
${browser}  Chrome
${id}  pm0c89634
${pwd}  Pr!y@nk@28$

*** Keywords ***
launch browser
    open browser  ${url}  ${browser}
    maximize browser window
    set selenium speed  1second
title check
    title should be  NetApp Login Page
login id and password
    input text  id:username  ${id}
    input text  id:password  ${pwd}
click on login
    click element  xpath://html/body/div/div[2]/div/div/form/input[2]
close popup
    click element  xpath://*[@id="18054acb-a08e-3e49-325d-1124886d5bec"]
close popup2
    click element  xpath://*[@id="walkme-survey-balloon-76177"]/div/div[1]/div[2]/div/div[1]
close popup3
    click element  xpath://*[@id="829ad5df-1634-4ce4-bf72-6b12f079e87a"]
default
    ${eng}  gettext  xpath://html/body
    create file  ${EXECDIR}/engdef.txt  ${eng}
selecting japanese language
    click element  xpath://html/body/aiq-root/div[1]/aiq-sidenav/mat-sidenav-container/mat-sidenav-content/div/div/div/aiq-page-header/div[2]/div[2]/aiq-header-actions/div[1]/div/div[4]
    click element  xpath://*[@id="cdk-overlay-0"]/div/div/button[2]
    capture page screenshot  Japanese.png
    sleep  5
japanese text
    ${jap}  gettext  xpath://html/body
    create file  ${EXECDIR}/jap.txt  ${jap}
english characters- japanese
    ${body}  gettext  xpath://html/body
    ${a}   Get Regexp Matches    ${body}   [a-zA-Z]
    log to console  ${a}
selecting chinese language
    click element  xpath://html/body/aiq-root/div[1]/aiq-sidenav/mat-sidenav-container/mat-sidenav-content/div/div/div/aiq-page-header/div[2]/div[2]/aiq-header-actions/div[1]/div/div[4]
    click element  xpath://*[@id="cdk-overlay-0"]/div/div/button[3]
    capture page screenshot  Chinese.png
    sleep  5
chinese text
    ${chin}  gettext  xpath://html/body
    create file  ${EXECDIR}/chin.txt  ${chin}
english characters- chinese
    ${text}  gettext  xpath://html/body
    ${b}   Get Regexp Matches    ${text}   [a-zA-Z]
    log to console  ${b}
Executing python files
    Run process  python.exe    ${EXECDIR}/last.py
    Run process  python.exe    ${EXECDIR}/example1.py
    Run process  python.exe    ${EXECDIR}/english_char.py
