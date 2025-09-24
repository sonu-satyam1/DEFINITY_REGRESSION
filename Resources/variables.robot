*** Settings ***
Documentation     Definity
Library           SeleniumLibrary
Library           ScreenCapLibrary
Library           String
Library           BuiltIn
Library           Random
Variables        ../Resources/variable.py

*** Variables ***
${expected_bulk_edit_popup_message}    Edit Job Orders
@{FIVE_TAGS}
@{ACTUAL_FIVE_TAGS_PRESENT}
${pay_package_tab_header}              Pay Package(Vendor)
${actual_regular_rate}                 NONE
${Vendor_name}                         UI Auto Vendor
${JOB_ID}                              2049
${first_name}                          UI Auto
${professional_summary}                test Ui automation
${onboardingMessage}                   test Ui automation onboarding message
${first_added_credential}              NONE
${searched_credential}                 NONE
${random_credential}                   NONE
${credentials_list_in_required_at_start_after_edit}     NONE
${credentials_list_in_required_at_start_before_edit}    NONE
${second_cred_added}                   NONE
${first_skill_assessment_template}     NONE
${second_skill_assessment_template}    NONE
${quick_filter_expired_past_due_name_count}    NONE
${list_expired_past_due_name_count_}    NONE
${quick_pending_verification_count}    NONE
${list_pending_verification_count}     NONE
${quick_pending_upload_count}          NONE
${list_pending_upload_count}           NONE
${quick_Rejected_name_count}           NONE
${list_Rejected_count}                 NONE
${quick_Expiring_name_count}           NONE
${uploaded_cred_name}                  NONE
${float_pool_talent_name}              NONE
${floatpool_location}                  NONE
${contact ending in 30days quick filter count}    NONE
${contact ending in 60days quick filter count}    NONE
${floatpool_talent_start_end_date}      NONE
${floatpool_talent_location}            NONE
${floatpool_talent_qualification}       NONE
${hcs_talent_start_end_date}            NONE
${hcs_talent_location}                  NONE
${hcs_talent_qualification}             NONE



