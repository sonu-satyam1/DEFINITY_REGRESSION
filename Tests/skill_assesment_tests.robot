*** Settings ***
Documentation        Definity
Library            SeleniumLibrary
Library           ScreenCapLibrary
Test Setup        open browser with url and login
Test Teardown     close browser session
Resource        ../Resources/resource.robot
Resource        ../POM/Skills_Administration.robot
Library         String


*** Test Cases ***
Verify if user is able to add multiple templates to a skill on create -2 or more templates Must be allowed
    open settings
    open skills administration
    open add skill window
    enter skill name in add skill window
    Select Valid Skill Category For Skill Type
    select valid hiring process
    enter onboarding message details
    upload document while adding skill
    enable skill assessment required checkbox while adding skill
    Select One Skill Assessment From List of skill type
    select one test type assessment from the list
    click on save button on add skill window
    search for newly created skill and validate the skill assessment templated added and validate for 2 template

Verify if user is able to add multiple templates to a skill on create- 1 template Must be allowed
    open settings
    open skills administration
    open add skill window
    enter skill name in add skill window
    Select Valid Skill Category For Skill Type
    select valid hiring process
    enter onboarding message details
    upload document while adding skill
    enable skill assessment required checkbox while adding skill
    Select One Skill Assessment From List of skill type
    click on save button on add skill window
    search for newly created skill and validate the skill assessment templated added and validate for 1 template

Verify if user is able to add multiple templates to a skill on create-0 templates, Must not be allowed
    open settings
    open skills administration
    open add skill window
    enter skill name in add skill window
    Select Valid Skill Category For Skill Type
    select valid hiring process
    enter onboarding message details
    upload document while adding skill
    enable skill assessment required checkbox while adding skill
    validate save button is disabled

Verify if user is able to add multiple templates to a skill on create-Skill assessment disabled Must be allowed
    open settings
    open skills administration
    open add skill window
    enter skill name in add skill window
    Select Valid Skill Category For Skill Type
    select valid hiring process
    enter onboarding message details
    upload document while adding skill
    validate skill assessment required checkbox is unchecked
    validate save button is enabled
    click on save button on add skill window
    search for newly created skill and validate the name added and validate without skill template added

Verify if user is able edit skill having skill assessment templates enabled
    open settings
    open skills administration
    open add skill window
    enter skill name in add skill window
    Select Valid Skill Category For Skill Type
    select valid hiring process
    upload document while adding skill
    enable skill assessment required checkbox while adding skill
    Select One Skill Assessment From List of skill type
    validate save button is enabled
    click on save button on add skill window
    search for newly created skill and edit
    enter onboarding message details
    click on save button on add skill window
    Validate the skill after editing that the skill assessment templated gets added for 1 template



Verify if user is able to add multiple templates to a skill on Edit,1 template -Must be allowed
    open settings
    open skills administration
    open add skill window
    enter skill name in add skill window
    Select Valid Skill Category For Skill Type
    select valid hiring process
    enter onboarding message details
    upload document while adding skill
    validate skill assessment required checkbox is unchecked
    validate save button is enabled
    click on save button on add skill window
    search for newly created skill and edit
    enable skill assessment required checkbox while adding skill
    Select One Skill Assessment From List of skill type
    click on save button on add skill window
    Validate the skill after editing that the skill assessment templated gets added for 1 template

Verify if user is able to add multiple templates to a skill on Edit,2 template -Must be allowed
    open settings
    open skills administration
    open add skill window
    enter skill name in add skill window
    Select Valid Skill Category For Skill Type
    select valid hiring process
    enter onboarding message details
    upload document while adding skill
    validate skill assessment required checkbox is unchecked
    validate save button is enabled
    click on save button on add skill window
    search for newly created skill and edit
    enable skill assessment required checkbox while adding skill
    Select One Skill Assessment From List of skill type
    select one test type assessment from the list
    click on save button on add skill window
    Validate the skill after editing that the skill assessment templated gets added for 2 or more templates



Verify if user is able to add multiple templates to a skill on Edit,0 template -Must not be allowed to save
    open settings
    open skills administration
    open add skill window
    enter skill name in add skill window
    Select Valid Skill Category For Skill Type
    select valid hiring process
    enter onboarding message details
    upload document while adding skill
    validate skill assessment required checkbox is unchecked
    validate save button is enabled
    click on save button on add skill window
    search for newly created skill and edit
    enable skill assessment required checkbox while adding skill
    validate save button is disabled

Verify if user is able Edit a skill and save, Skill assessment disabled Must be allowed to save
    open settings
    open skills administration
    open add skill window
    enter skill name in add skill window
    Select Valid Skill Category For Skill Type
    select valid hiring process
    upload document while adding skill
    click on save button on add skill window
    search for newly created skill and edit
    enter onboarding message details
    validate skill assessment required checkbox is unchecked
    validate save button is enabled


Verify the values in "Assessment Required" and "Assessment template" in Core > Settings > Skill Administration Tab when Skill Assessment is enabled
    open settings
    open skills administration
    open add skill window
    enter skill name in add skill window
    Select Valid Skill Category For Skill Type
    select valid hiring process
    enter onboarding message details
    upload document while adding skill
    enable skill assessment required checkbox while adding skill
    Select One Skill Assessment From List of skill type
    click on save button on add skill window
    search for newly created skill and validate the "Assessment Required" and "Assessment template" value in column


Verify the values in "Assessment Required" and "Assessment template" in Core > Settings > Skill Administration Tab when Skill Assessment is disabled.
    open settings
    open skills administration
    open add skill window
    enter skill name in add skill window
    Select Valid Skill Category For Skill Type
    select valid hiring process
    enter onboarding message details
    upload document while adding skill
    click on save button on add skill window
    search for newly created skill without skill assessment and validate the "Assessment Required" and "Assessment template" value in column








