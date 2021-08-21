Feature: ###JIRA Ticket Number### As a ABCGroceryStore mobile app customer having ATM PIN Enabled and I want to perfrom a High Risk Transaction and verify it is Routed through ATM PIN Interdiction Scree.

Interdiction is a Control Point where user is highlighted that the transaction he is doing posseses a higher risk.
As part of this change user will now be directley routed to user default Authentication methond ATM PIN.
In case user wants to change the authentication method, he/she will still have "Try Another Method" button to swtich to a different method.

# We need Test Username and PWD for Below type of Users:
# 1) with ATM PIN Auth Enabled and No OTP Auth Enabled with Eligible Mobile Number : Interdiction User 1
# 2) with ATM PIN Disabled and OTP Auth Enabled with Eligible Mobile Number : Interdiction User 2 (??????????need eligible mobile Number??????????)
# 3) with ATM PIN Disabled and No Elibilbe OTP Mobile Number : Interdiction User 3
# 4) with ATM PIN Enabled and Elibilbe OTP Mobile Number : Interdiction User 4 (??????????need eligible mobile Number??????????)
# 5) with ATM PIN Enabled and No other Auth Enabled

# Conditional Testing - Feature should apper basis on specific conditions

Scenario Outline: '<FOLB Customer>' should see Interdiction Screen In case he is perfroming a High Risk Transaction
    Given I am logged in to Wells    Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Label>' label
    Examples:
        | FOLB Customer        | Control Point                  | On Screen Label                                               |
        | Interdiction User 1  | Account Unmask - View Acct#    | Enter the PIN of any of your ABCGroceryStore debit or ATM cards.  |
        | Interdiction User 4  | Account Unmask - View Acct#    | Enter the PIN of any of your ABCGroceryStore debit or ATM cards.  |
        | Interdiction User 1  | Rewards - Consumer in-session  | Enter the PIN of any of your ABCGroceryStore debit or ATM cards.  |
        | Interdiction User 4  | Rewards - Consumer in-session  | Enter the PIN of any of your ABCGroceryStore debit or ATM cards.  |

Scenario Outline: '<FOLB Customer>' "Try Another Menthod" Button should not be present In case he is perfroming a High Risk Transaction and Eligible only for 1 Auth - ATM PIN
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Label>' label
    Then I should not see the 'Try Another Method' Button
    Examples:
        | FOLB Customer        | Control Point                  | On Screen Label                                               |
        | Interdiction User 5  | Account Unmask - View Acct#    | Enter the PIN of any of your ABCGroceryStore debit or ATM cards.  |
        | Interdiction User 5  | Rewards - Consumer in-session  | Enter the PIN of any of your ABCGroceryStore debit or ATM cards.  |

# Exit Functionality Testing - In case user wants to exit the functionality from any screen
Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default ATM PIN as Interdiction Method, click close button(X on top right of screen), Intediction Screen Should Close.
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Label>' label
    When I click on 'Top Right Cross Button'
    Then I should see the "<Control Point>" lable
    Examples:
        | FOLB Customer        | Control Point                  | On Screen Label                                               |
        | Interdiction User 1  | Account Unmask - View Acct#    | Enter the PIN of any of your ABCGroceryStore debit or ATM cards.  |
        | Interdiction User 4  | Account Unmask - View Acct#    | Enter the PIN of any of your ABCGroceryStore debit or ATM cards.  |
        | Interdiction User 1  | Rewards - Consumer in-session  | Enter the PIN of any of your ABCGroceryStore debit or ATM cards.  |
        | Interdiction User 4  | Rewards - Consumer in-session  | Enter the PIN of any of your ABCGroceryStore debit or ATM cards.  |

# Screen Object/User Interface Testing - Verify that all the Controls/labels/images/objects are present on screen
Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default ATM PIN Interdiction Method, I should see all the Controls/labels/images/objects On Screen.
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control 1>' label
    And I should see the '<On Screen Control 2>' label
    And I should see the '<On Screen Control 3>' label
    And I should see the '<On Screen Control 4>' textbox
    And I should see the '<On Screen Control 5>' button
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1      | On Screen Control 2                                           | On Screen Control 3 | On Screen Control 4 | On Screen Control 5       |
        | Interdiction User 1  | Account Unmask - View Acct#  | Let's make sure it's you | Enter the PIN of any of your ABCGroceryStore debit or ATM cards.  | PIN Textbox         | Continue Button     | Try Another Method Button |
        | Interdiction User 4  | Account Unmask - View Acct#  | Let's make sure it's you | Enter the PIN of any of your ABCGroceryStore debit or ATM cards.  | PIN Textbox         | Continue Button     | Try Another Method Button |

# User Interaction Testing - Verify that ATM PIN Text Box is User interactive. i.e on click Keypad is activated.
Scenario Outline: '<FOLB Customer>' while perfroming a High Risk Transaction and Eligible for ATM PIN, while entering ATM PIN value in textbox, he should see numeric keypad.
Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control>' textbox
    When I click on '<On Screen Control>' textbox
    Then I should see the 'Alpha-Numeric' keypad
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control   |
        | Interdiction User 1  | Account Unmask - View Acct#  | PIN Textbox         |
        | Interdiction User 4  | Account Unmask - View Acct#  | PIN Textbox         |

Scenario Outline: '<FOLB Customer>' while perfroming a High Risk Transaction and Eligible for ATM PIN, continue button should only be enabled when 4-14 Alpha-numeric Chars are entered
Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control>' textbox
    When I click on '<On Screen Control>' textbox
    And I enter '<ATM PIN>' in '<On Screen Control>'
    Then I should see the 'Continue Button Control' as '<Continue Button Status>'
    When I enter '#BACKSPACE#' in '<On Screen Control>'
    Then I should see the 'Continue Button Control' as 'disabled'
    When I enter '1' in '<On Screen Control>'
    Then I should see the '<On Screen Control>' as '<Continue Button Status>'
        Examples:
        | FOLB Customer        | Control Point                | On Screen Control   | ATM PIN        | Continue Button Status |
        | Interdiction User 1  | Account Unmask - View Acct#  | PIN Textbox         | 123            | disabled               |
        | Interdiction User 4  | Account Unmask - View Acct#  | PIN Textbox         | 123            | disabled               |
        | Interdiction User 1  | Account Unmask - View Acct#  | PIN Textbox         | 123a           | enabled                |
        | Interdiction User 4  | Account Unmask - View Acct#  | PIN Textbox         | 123a           | enabled                |
        | Interdiction User 1  | Account Unmask - View Acct#  | PIN Textbox         | 1234abc89012   | enabled                |
        | Interdiction User 4  | Account Unmask - View Acct#  | PIN Textbox         | 1234abc89012   | enabled                |
        | Interdiction User 1  | Account Unmask - View Acct#  | PIN Textbox         | ab34567890ab34 | enabled                |
        | Interdiction User 4  | Account Unmask - View Acct#  | PIN Textbox         | ab34567890ab34 | enabled                |

Scenario Outline: '<FOLB Customer>' while perfroming a High Risk Transaction and Eligible for ATM PIN, user should not be able to enter more than 4-14 Alpha-numeric Chars and Special-Chars
Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control>' label
    When I click on '<On Screen Control>' textbox
    When I enter '<ATM PIN>' in '<On Screen Control>'
    Then I see lenght of characters in '<On Screen Control>' is '<Length ATM PIN>'
    And I see value of '<On Screen Control>' is '<On Screen ATM PIN>'
    When I clear '<On Screen Control>' textbox
    And I paste '<ATM PIN>' in '<On Screen Control>'
    Then I see lenght of characters in '<On Screen Control>' is '<Length ATM PIN>'
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control   | ATM PIN           | Length ATM PIN   | On Screen ATM PIN   |
        | Interdiction User 1  | Account Unmask - View Acct#  | Device Code Textbox | 123               | 3                | ...                 |
        | Interdiction User 4  | Account Unmask - View Acct#  | Device Code Textbox | 123               | 3                | ...                 |
        | Interdiction User 1  | Account Unmask - View Acct#  | Device Code Textbox | 1234              | 4                | ....                |
        | Interdiction User 4  | Account Unmask - View Acct#  | Device Code Textbox | 1234              | 4                | ....                |
        | Interdiction User 1  | Account Unmask - View Acct#  | Device Code Textbox | 12345678901234    | 14               | ..............      |
        | Interdiction User 4  | Account Unmask - View Acct#  | Device Code Textbox | 12345678901234    | 14               | ..............      |
        | Interdiction User 1  | Account Unmask - View Acct#  | Device Code Textbox | 123a              | 4                | ....                |
        | Interdiction User 4  | Account Unmask - View Acct#  | Device Code Textbox | 123a              | 4                | ....                |
        | Interdiction User 1  | Account Unmask - View Acct#  | Device Code Textbox | 12bc34            | 6                | ......              |
        | Interdiction User 4  | Account Unmask - View Acct#  | Device Code Textbox | 12bc34            | 6                | ......              |
        | Interdiction User 1  | Account Unmask - View Acct#  | Device Code Textbox | a12345678901234   | 14               | ..............      |
        | Interdiction User 4  | Account Unmask - View Acct#  | Device Code Textbox | a12345678901234   | 14               | ..............      |
        | Interdiction User 1  | Account Unmask - View Acct#  | Device Code Textbox | #a34%67$          | 5                | .....               |
        | Interdiction User 4  | Account Unmask - View Acct#  | Device Code Textbox | #a34%67$          | 5                | .....               |

# Sequence Testing - Feature should apper as per Sequence Metioned
Scenario Outline: '<FOLB Customer>' should see picklist options in mentioned Priority In case he is perfroming a High Risk Transaction and Eligible for ATM PIN
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Label>' label
    When I click on 'Try Another Method'
    Then I should see the 'Availble Options' label
    And I validate the Sequence of picklist is correct
        | RSA SecureID                         | 1  |
        | Text me with a code                  | 2  |
        | Call me with a code                  | 3  |
        | Enter my debit/ATM card PIN          | 4  |
        | Send me a email                      | 5  |
    Examples:
        | FOLB Customer        | Control Point                | On Screen Label                                               |
        | Interdiction User 1  | Account Unmask - View Acct#  | Enter the PIN of any of your ABCGroceryStore debit or ATM cards.  |
        | Interdiction User 4  | Account Unmask - View Acct#  | Enter the PIN of any of your ABCGroceryStore debit or ATM cards.  |

# Negative Scenario Testing - 
Scenario Outline: '<FOLB Customer>' should see error popup In case he is perfroming a High Risk Transaction and Eligible for ATM PIN and entering wrong ATM PIN
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Label>' label
    When I click on '<On Screen Control>' textbox
    When I enter '<Wrong ATM PIN>' in '<On Screen Control>'
    And I click on 'Continue' button
    Then I see Modal Popup with Header Text "<Modal Header Text>" and Body Text as "<Modal Body Text>"
    When I click on "Modal OK Button"
    Then I should see the '<On Screen Label>' label
    Examples:
        | FOLB Customer        | Control Point                | On Screen Label                                               | Wrong ATM PIN   | Modal Header Text | Modal Body Text                                                                                     |
        | Interdiction User 1  | Account Unmask - View Acct#  | Enter the PIN of any of your ABCGroceryStore debit or ATM cards.  | 123456          | Let's try again   | ???????????????????????????????? |
        | Interdiction User 4  | Account Unmask - View Acct#  | Enter the PIN of any of your ABCGroceryStore debit or ATM cards.  | 123456          | Let's try again   | ???????????????????????????????? |

# Positive Scenario Testing

Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default ATM PIN as Interdiction Method, enters correct ATM PIN, I should be landed on Target Page.
Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default OTP as Interdiction Method, enters incorrect Token and later enters correct ATM PIN, I should be landed on Target Page.
Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default ATM PIN as Interdiction Method, enters incorrect Token for ????? times, ?????????to check????????.
