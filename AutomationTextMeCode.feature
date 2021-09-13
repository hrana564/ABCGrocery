Feature: ###JIRA Ticket Number### As a ABCGrocery mobile app customer having OTP Enabled and I want to perfrom a High Risk Transaction and verify it is Routed through On text OTP Interdiction Screen.

Interdiction is a Control Point where user is highlighted that the transaction he is doing posseses a higher risk.
As part of this change user will now be directley routed to user default Authentication methond On text OTP.
In case user wants to change the authentication method, he/she will still have "Try Another Method" button to swtich to a different method.

# We need Test Username and PWD for Below type of Users:
# 1) Interdiction User 1 : RSA + SMS + Call + Email + Debit Card
# 2) Interdiction User 2 : SMS (No Available Mobile No)
# 3) Interdiction User 3 : SMS
# 4) Interdiction User 4 : Debit Card
# 5) Interdiction User 5 : SMS + Call + Email + Debit Card
# 6) Interdiction User 6 : RSA
# 7) Interdiction User 7 : SMS + Call + Email + Debit Card
# 8) Interdiction User 8 : SMS + Call + Email + Debit Card
# 9) Interdiction User 9 : Call
# 10) Interdiction User 10 : Email
# 11) Interdiction User 11 : Call
# 12) Interdiction User 12 : SMS + Call + Email + Debit Card

# Conditional Testing - Feature should apper basis on specific conditions

Scenario Outline: '<FOLB Customer>' should see Interdiction Screen In case he is perfroming a High Risk Transaction
    Given I am logged in to ABCGrocery Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    # Tempoarary fix until default loading from Picklist is enabled
    When I click on 'Text Me a Code'
    Then I should see '<On Screen Label>' label
    Examples:
        | FOLB Customer        | Control Point                  | On Screen Label                     |
        | Interdiction User 1  | Account Unmask - View Acct#    | We'll text you with one-time code.  |


Scenario Outline: '<FOLB Customer>' "Try Another Menthod" Button should not be present In case he is perfroming a High Risk Transaction and Eligible only for 1 Auth - SMS OTP
    Given I am logged in to ABCGrocery Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    # Tempoarary fix until default loading from Picklist is enabled
    When I click on 'Text Me a Code'
    Then I should see '<On Screen Label>' label
    Then I should not see 'Try Another Method'
    Examples:
        | FOLB Customer        | Control Point                  | On Screen Label                     |
        | Interdiction User 3  | Account Unmask - View Acct#    | We'll text you with one-time code.  |


# Exit Functionality Testing - In case user wants to exit the functionality from any screen
Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default SMS OTP as Interdiction Method, click close button(X on top right of screen), Intediction Screen Should Close.
    Given I am logged in to ABCGrocery Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    # Tempoarary fix until default loading from Picklist is enabled
    When I click on 'Text Me a Code'
    Then I should see '<On Screen Label>' label
    When I click on 'Top Right Cross Button'
    Then I should see "<Control Point>" lable
    Examples:
        | FOLB Customer        | Control Point                  | On Screen Label                     |
        | Interdiction User 1  | Account Unmask - View Acct#    | We'll text you with one-time code.  |


Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default SMS OTP as Interdiction Method, click close button(X on top right of screen), Intediction Screen Should Close.
    Given I am logged in to ABCGrocery Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    # Tempoarary fix until default loading from Picklist is enabled
    When I click on 'Text Me a Code'
    Then I should see the '<On Screen Label>' label
    When I click on "<Mobile Number>" from Moblile Number list
    When I click on 'Top Right Cross Button'
    Then I should see "<Control Point>" lable
    Examples:
        | FOLB Customer        | Control Point                  | On Screen Label                     | Mobile Number     |
        | Interdiction User 1  | Account Unmask - View Acct#    | We'll text you with one-time code.  | (...) ... - 1234  |



# Screen Object/User Interface Testing - Verify that all the Controls/labels/images/objects are present on screen
Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default text OTP Interdiction Method, I should see all the Controls/labels/images/objects On Screen Eligible + InEligible + Multiple Auths.
    Given I am logged in to ABCGrocery Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    # Tempoarary fix until default loading from Picklist is enabled
    When I click on 'Text Me a Code'
    Then I should see '<On Screen Control 1>' label
    And I should see '<On Screen Control 2>' label
    And I should see '<On Screen Control 3>' label
    And I should see '<On Screen Control 4>' label
    And I should see '<On Screen Control 5>' button
    And I should see '<On Screen Control 6>' label
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1                 | On Screen Control 2                                                                  | On Screen Control 3                | On Screen Control 4  | On Screen Control 5  | On Screen Control 6  |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll text you with one-time code.  | By continuing, you agree that we can send you the code using the number you select.  | Message and data rates may apply.  | Select one           | Try Another Method   | Unavailble Numbers   |

Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default text OTP Interdiction Method, I should see all the Controls/labels/images/objects On Screen Only Eligible + No InEligible + Multiple Auths.
    Given I am logged in to ABCGrocery Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    # Tempoarary fix until default loading from Picklist is enabled
    When I click on 'Text Me a Code'
    Then I should see '<On Screen Control 1>' label
    And I should see '<On Screen Control 2>' label
    And I should see '<On Screen Control 3>' label
    And I should see '<On Screen Control 4>' label
    And I should see '<On Screen Control 5>' button
    And I should not see '<On Screen Control 6>' label
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1                 | On Screen Control 2                                                                  | On Screen Control 3                 | On Screen Control 4  | On Screen Control 5  | On Screen Control 6  |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll text you with one-time code.  | By continuing, you agree that we can send you the code using the number you select.  |  Message and data rates may apply.  | Select one           | Try Another Method   | Unavailble Numbers   |

Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default text OTP Interdiction Method, I should see all the Controls/labels/images/objects On Screen Only Eligible + No InEligible + Single Auth.
    Given I am logged in to ABCGrocery Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    # Tempoarary fix until default loading from Picklist is enabled
    When I click on 'Text Me a Code'
    Then I should see '<On Screen Control 1>' label
    And I should see '<On Screen Control 2>' label
    And I should see '<On Screen Control 3>' label
    And I should see '<On Screen Control 4>' label
    And I should not see '<On Screen Control 5>' button
    And I should not see '<On Screen Control 6>' label
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1                 | On Screen Control 2                                                                  | On Screen Control 3                 | On Screen Control 4  | On Screen Control 5  | On Screen Control 6  |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll text you with one-time code.  | By continuing, you agree that we can send you the code using the number you select.  |  Message and data rates may apply.  | Select one           | Try Another Method   | Unavailble Numbers   |


# User Interaction Testing - Verify that SMS OTP Text Box is User interactive. i.e on click Keypad is activated.
Scenario Outline: '<FOLB Customer>' while perfroming a High Risk Transaction and Eligible for SMS OTP, while entering OTP value in textbox, he should see numeric keypad.
Given I am logged in to ABCGrocery Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    # Tempoarary fix until default loading from Picklist is enabled
    When I click on 'Text Me a Code'
    Then I should see '<On Screen Control 1>' label
    When I click on "<Mobile Number>" from Moblile Number list
    Then I should see '<On Screen Control 2>' label
    And I should see '<On Screen Control 3>' box
    When I click on '<On Screen Control 3>' box
    Then I should see the 'Numeric' keypad
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1                 | Mobile Number     | On Screen Control 2                                   | On Screen Control 3  |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll text you with one-time code.  | (...) ... - 1234  | A code was sent to (...) ... - 3859 by text message.  | OTP Textbox          |


Scenario Outline: '<FOLB Customer>' while perfroming a High Risk Transaction and Eligible for SMS OTP, continue button should only be enabled when 6 digits are entered
Given I am logged in to ABCGrocery Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    # Tempoarary fix until default loading from Picklist is enabled
    When I click on 'Text Me a Code'
    Then I should see '<On Screen Control 1>' label
    When I click on "<Mobile Number>" from Moblile Number list
    Then I should see '<On Screen Control 2>' label
    And I should see '<On Screen Control 3>' box
    When I click on '<On Screen Control 3>' textbox
    And I set '<OTP Code>' in '<On Screen Control 3>'
    Then I should see 'Continue Button Control' as '<Continue Button Status>'
    When I enter '#BACKSPACE#' in '<On Screen Control>'
    Then I should see 'Continue Button Control' as 'disabled'
    When I enter '1' in '<On Screen Control 3>'
    Then I should see '<On Screen Control 3>' as '<Continue Button Status>'
        Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1                 | Mobile Number     | On Screen Control 2  | On Screen Control   | OTP Code  | Continue Button Status |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll text you with one-time code.  | (...) ... - 1234  | Enter code           | OTP Textbox         | 123       | disabled               |


Scenario Outline: '<FOLB Customer>' while perfroming a High Risk Transaction and Eligible for SMS OTP, user should not be able to enter more than 6 digits and alphabets/special chars.
Given I am logged in to ABCGrocery Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    # Tempoarary fix until default loading from Picklist is enabled
    When I click on 'Text Me a Code'
    Then I should see '<On Screen Control 1>' label
    When I click on "<Mobile Number>" from Moblile Number list
    Then I should see '<On Screen Control 2>' label
    And I should see '<On Screen Control 3>' box
    When I click on '<On Screen Control 3>' textbox
    And I set '<OTP Code>' in '<On Screen Control 3>'
    Then I see lenght of characters in '<On Screen Control 3>' is '<Length OTP Code>'
    And I should see '<On Screen Control 3>' is '<On Screen OTP Code>'
    When I set '' in '<On Screen Control 3>'
    And I should see '<On Screen Control 3>' is ''
    When I set '<OTP Code>' in '#CLIPBOARD#'
    And I set '#CLIPBOARD#' in '<On Screen Control 3>'
    Then I see lenght of characters in '<On Screen Control 3>' is '<Length OTP Code>'
    And I should see '<On Screen Control 3>' is '<On Screen OTP Code>'
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1                 | Mobile Number     | On Screen Control 2  | On Screen Control   | OTP Code  | Length OTP Code  | On Screen OTP Code  |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll text you with one-time code.  | (...) ... - 1234  | Enter code           | OTP Textbox         | 123       | 3                | 123                 |


# Sequence Testing - Feature should apper as per Sequence Metioned
Scenario Outline: '<FOLB Customer>' should see picklist options in mentioned Priority In case he is perfroming a High Risk Transaction and Eligible for OTP
    Given I am logged in to ABCGrocery Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control 1>' label
    When I click on "<Mobile Number>" from Moblile Number list
    Then I should see the '<On Screen Control 2>' label
    When I click on 'Try Another Method'
    Then I should see the 'Availble Options' label
    And I validate the Sequence of picklist is correct
        | Text me with a code        | 1  |
        | call me with a code        | 2  |
        | Enter my card PIN          | 3  |
        | Send me a email            | 4  |
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1                 | Mobile Number     | On Screen Control 2  |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll text you with one-time code.  | (...) ... - 1234  | Enter code           |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll text you with one-time code.  | (...) ... - 1234  | Enter code           |


Scenario Outline: '<FOLB Customer>' should see Eligilble Mobile Numbers In case he is perfroming a High Risk Transaction and Eligible for OTP
    Given I am logged in to ABCGrocery Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control 1>' label
    And I validate the Sequence of 'Eligible Mobile Numbers' is correct
        | (...) ... - 1234  | Home |
        | (...) ... - 1235  | Work |
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1                 |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll call you with one-time code.  |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll call you with one-time code.  |
        | Interdiction User 3  | Account Unmask - View Acct#  | We'll call you with one-time code.  |

Scenario Outline: '<FOLB Customer>' should see Eligilble Mobile Numbers In case he is perfroming a High Risk Transaction and Eligible for OTP
    Given I am logged in to ABCGrocery Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control 1>' label
    And I validate the Sequence of 'Unavailable Numbers' is correct
        | (...) ... - 9234  | Mobile |
        | (...) ... - 9235  | Home   |
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1                 |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll call you with one-time code.  |
