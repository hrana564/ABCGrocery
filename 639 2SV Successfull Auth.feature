Feature: DPDX-637 As a ABC Grocery Andriod mobile app customer having 2SV Enabled and Successfully Authenticated Interdiction.

# Users Detials

@Interdiction @2SVInterdiction @2SVRSAInterdiction 
Scenario Outline: '<FOLB Customer>' Login in to App when 2SV Switch is Enabled.
    Given  '<FOLB Customer>' have 2SV Switch '<2SV Switch Status>'
    Given I am logged in to ABC Grocery Online banking as '<FOLB Customer>'
    Then I should see '<On Screen Label 1>' label
    When I click on '<On Screen Control 1>'
    And I enter details '<RSA Code>' in '<On Screen Control 1>'
    When I click on '<On Screen Control 2>'
    Then I should see '<On Screen Label 2>' label
    Examples:
        | FOLB Customer       | 2SV Switch Status     | On Screen Label 1                | On Screen Control 1 | RSA Code | On Screen Control 2 | On Screen Label 2 |
        | Interdiction 1 RSA  | On, at every sign on  | Enter code from my RSA SecureID  | Device Code         | 123456   | Continue            | Account Summary   |

@Interdiction @2SVSMSCallEmailInterdiction
Scenario Outline: '<FOLB Customer>' Login in to App when 2SV Switch is Enabled.
    Given  '<FOLB Customer>' have 2SV Switch '<2SV Switch Status>'
    Given I am logged in to ABC Grocery Online banking as '<FOLB Customer>'
    Then I should see '<On Screen Label 1>' label
    When I click on '<On Screen Control 1>'
    Then I should see '<On Screen Label 2>' label
    When I click on '<On Screen Control 2>'
    And I enter details '<OTP Code>' in '<On Screen Control 2>'
    When I click on '<On Screen Control 3>'
    Then I should see '<On Screen Label 3>' label
    Examples:
        | FOLB Customer                  | 2SV Switch Status     | On Screen Label 1  | On Screen Control 1 | On Screen Label 2     | On Screen Control 2 | OTP Code | On Screen Control 3 | On Screen Label 3 |
        | Interdiction 1 SMS Email Call  | On, at every sign on  | Select Phone No    | 123-123-1234        | Enter the Code Below  | OTP Code            | 123456   | Continue            | Account Summary   |


@Interdiction @2SVOCSInterdiction
Scenario Outline: '<FOLB Customer>' Login in to App when 2SV Switch is Enabled.
    Given  '<FOLB Customer>' have 2SV Switch '<2SV Switch Status>'
    Given I am logged in to ABC Grocery Online banking as '<FOLB Customer>'
    Then I should see '<On Screen Label 1>' label
    When I click on '<On Screen Control 1>'
    Then I should see '<On Screen Label 2>' label
    When I click on '<On Screen Control 2>'
    And I enter details '<OTP Code>' in '<On Screen Control 2>'
    When I click on '<On Screen Control 3>'
    Then I should see '<On Screen Label 3>' label
    Examples:
        | FOLB Customer       | 2SV Switch Status     | On Screen Label 1      | On Screen Control 1 | On Screen Label 2 | On Screen Control 2 | OTP Code | On Screen Control 3 | On Screen Label 3 |
        | Interdiction 1 OCS  | On, at every sign on  | ocs_important_message  | ocs_get_code_button | ocs_instructions  | OTP Code            | 123456   | Continue            | Account Summary   |
