Feature: DPDX-637 As a ABC Grocery Andriod mobile app customer having 2SV Enabled and Cancels / Fails Interdiction.

# Users Detials

@Interdiction @2SVInterdiction @2SVRSAInterdiction 
Scenario Outline: '<FOLB Customer>' Login in to App when 2SV Switch is Enabled.
    Given  '<FOLB Customer>' have 2SV Switch '<2SV Switch Status>'
    Given I am logged in to ABC Grocery Online banking as '<FOLB Customer>'
    Then I should see '<On Screen Label 1>' label
    When I click on '<On Screen Control 1>'
    Then I should see '<On Screen Label 2>' label
    Examples:
        | FOLB Customer                | 2SV Switch Status     | On Screen Label 1                      | On Screen Control 1 | On Screen Label 2 |
        | Interdiction 1 RSA           | On, at every sign on  | Enter code from my RSA SecureID        | CLOSE-X             | Logoff Screen     |
        | Interdiction 1 SMS OTP Call  | On, at every sign on  | Select Phone No                        | CLOSE-X             | Logoff Screen     |
        | Interdiction 1 OCS           | On, at every sign on  | ocs_important_message                  | CLOSE-X             | Logoff Screen     |

@Interdiction @2SVSMSCallEmailOCSInterdiction
Scenario Outline: '<FOLB Customer>' Login in to App when 2SV Switch is Enabled.
    Given  '<FOLB Customer>' have 2SV Switch '<2SV Switch Status>'
    Given I am logged in to ABC Grocery Online banking as '<FOLB Customer>'
    Then I should see '<On Screen Label 1>' label
    When I click on '<On Screen Control 1>'
    Then I should see '<On Screen Label 2>' label
    When I click on '<On Screen Control 2>'
    Then I should see '<On Screen Label 3>' label
    Examples:
        | FOLB Customer                | 2SV Switch Status     | On Screen Label 1     | On Screen Control 1 | On Screen Label 2     | On Screen Control 2 | On Screen Label 3 |
        | Interdiction 1 SMS OTP Call  | On, at every sign on  | Select Phone No       | 123-123-1234        | Enter the Code Below  | CLOSE-X             | Logoff Screen     |
        | Interdiction 1 OCS           | On, at every sign on  | ocs_important_message | ocs_get_code_button | ocs_instructions      | CLOSE-X             | Logoff Screen     |
