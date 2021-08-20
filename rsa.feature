Feature: ###JIRA Ticket Number### As a ABCGroceryStore mobile app customer having RSA Enabled and I want to perfrom a High Risk Transaction and verify it is Routed through RSA(FOB) Interdiction Scree.

Interdiction is a Control Point where user is highlighted that the transaction he is doing posseses a higher risk.
As part of this change user will now be directley routed to user default Authentication methond RSA Token.
In case user wants to change the authentication method, he/she will still have "Try Another Method" button to swtich to a different method.

# We need Test Username and PWD for Below type of Users:
# 1) with RSA Auth Enabled and No OTP Auth Enabled with Eligible Mobile Number : Interdiction User 1
# 2) with RSA Auth Disabled and OTP Auth Enabled with Eligible Mobile Number : Interdiction User 2 (??????????need eligible mobile Number??????????)
# 3) with RSA Auth Disabled and No Elibilbe OTP Mobile Number : Interdiction User 3
# 4) with RSA Auth Enabled and Elibilbe OTP Mobile Number : Interdiction User 4 (??????????need eligible mobile Number??????????)

# Conditional Testing - Feature should apper basis on specific conditions

Scenario Outline: '<FOLB Customer>' should see Interdiction Screen In case he is perfroming a High Risk Transaction
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Label>' label
    Examples:
        | FOLB Customer        | Control Point                  | On Screen Label                               |
        | Interdiction User 1  | Account Unmask - View Acct#    | Enter the code from your RSA SecureID device  |
        | Interdiction User 4  | Account Unmask - View Acct#    | Enter the code from your RSA SecureID device  |
        | Interdiction User 1  | Rewards - Consumer in-session  | Enter the code from your RSA SecureID device  |
        | Interdiction User 4  | Rewards - Consumer in-session  | Enter the code from your RSA SecureID device  |

# Exit Functionality Testing - In case user wants to exit the functionality from any screen
Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default RSA as Interdiction Method, click close button(X on top right of screen), Intediction Screen Should Close.
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Label>' label
    When I click on 'Top Right Cross Button'
    Then I should see the "<Control Point>" lable
    Examples:
        | FOLB Customer        | Control Point                  | On Screen Label                               |
        | Interdiction User 1  | Account Unmask - View Acct#    | Enter the code from your RSA SecureID device  |
        | Interdiction User 4  | Account Unmask - View Acct#    | Enter the code from your RSA SecureID device  |
        | Interdiction User 1  | Rewards - Consumer in-session  | Enter the code from your RSA SecureID device  |
        | Interdiction User 4  | Rewards - Consumer in-session  | Enter the code from your RSA SecureID device  |

# Screen Object/User Interface Testing - Verify that all the Controls/labels/images/objects are present on screen
Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default RSA Interdiction Method, I should see all the Controls/labels/images/objects On Screen.
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control 1>' label
    And I should see the '<On Screen Control 2>' label
    And I should see the '<On Screen Control 3>' label
    And I should see the '<On Screen Control 4>' textbox
    And I should see the '<On Screen Control 5>' button
    And I should see the '<On Screen Control 6>' button
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1      | On Screen Control 2 | On Screen Control 3                          | On Screen Control 4 | On Screen Control 5 | On Screen Control 6       |
        | Interdiction User 1  | Account Unmask - View Acct#  | Let's make sure it's you | RSA Image           | Enter the code from your RSA SecureID device | Device Code Textbox | Continue Button     | Try Another Method Button |
        | Interdiction User 4  | Account Unmask - View Acct#  | Let's make sure it's you | RSA Image           | Enter the code from your RSA SecureID device | Device Code Textbox | Continue Button     | Try Another Method Button |

# User Interaction Testing - Verify that RSA Text Box is User interactive. i.e on click Keypad is activated.
Scenario Outline: '<FOLB Customer>' while perfroming a High Risk Transaction and Eligible for RSA, while entering RSA value in textbox, he should see numeric keypad.
Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control>' textbox
    When I click on '<On Screen Control>' textbox
    Then I should see the 'Numeric' keypad
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control   |
        | Interdiction User 1  | Account Unmask - View Acct#  | Device Code Textbox |
        | Interdiction User 4  | Account Unmask - View Acct#  | Device Code Textbox |

Scenario Outline: '<FOLB Customer>' while perfroming a High Risk Transaction and Eligible for RSA, continue button should only be enabled when 6 digits are entered
Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control>' textbox
    When I click on '<On Screen Control>' textbox
    And I enter '<RSA Token>' in '<On Screen Control>'
    Then I should see the 'Continue Button Control' as '<Continue Button Status>'
    When I enter '#BACKSPACE#' in '<On Screen Control>'
    Then I should see the 'Continue Button Control' as 'disabled'
    When I enter '1' in '<On Screen Control>'
    Then I should see the '<On Screen Control>' as '<Continue Button Status>'
        Examples:
        | FOLB Customer        | Control Point                | On Screen Control   | RSA Token | Continue Button Status |
        | Interdiction User 1  | Account Unmask - View Acct#  | Device Code Textbox | 123       | disabled               |
        | Interdiction User 4  | Account Unmask - View Acct#  | Device Code Textbox | 123       | disabled               |
        | Interdiction User 1  | Account Unmask - View Acct#  | Device Code Textbox | 123456    | enabled                |
        | Interdiction User 4  | Account Unmask - View Acct#  | Device Code Textbox | 123456    | enabled                |
        | Interdiction User 1  | Account Unmask - View Acct#  | Device Code Textbox | 12345678  | enabled                |
        | Interdiction User 4  | Account Unmask - View Acct#  | Device Code Textbox | 12345678  | enabled                |

Scenario Outline: '<FOLB Customer>' while perfroming a High Risk Transaction and Eligible for RSA, user should not be able to enter more than 6 digits and alphabets
Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control>' label
    When I click on '<On Screen Control>' textbox
    When I enter '<RSA Token>' in '<On Screen Control>'
    Then I see lenght of characters in '<On Screen Control>' is '<Length RSA Token>'
    And I see value of '<On Screen Control>' is '<On Screen RSA Token>'
    When I clear '<On Screen Control>' textbox
    And I paste '<RSA Token>' in '<On Screen Control>'
    Then I see lenght of characters in '<On Screen Control>' is '<Length RSA Token>'
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control   | RSA Token | Length RSA Token | On Screen RSA Token |
        | Interdiction User 1  | Account Unmask - View Acct#  | Device Code Textbox | 123       | 3                | 123                 |
        | Interdiction User 4  | Account Unmask - View Acct#  | Device Code Textbox | 123       | 3                | 123                 |
        | Interdiction User 1  | Account Unmask - View Acct#  | Device Code Textbox | 123456    | 6                | 123456              |
        | Interdiction User 4  | Account Unmask - View Acct#  | Device Code Textbox | 123456    | 6                | 123456              |
        | Interdiction User 1  | Account Unmask - View Acct#  | Device Code Textbox | 12345678  | 6                | 123456              |
        | Interdiction User 4  | Account Unmask - View Acct#  | Device Code Textbox | 12345678  | 6                | 123456              |
        | Interdiction User 1  | Account Unmask - View Acct#  | Device Code Textbox | 123a      | 3                | 123                 |
        | Interdiction User 4  | Account Unmask - View Acct#  | Device Code Textbox | 123a      | 3                | 123                 |
        | Interdiction User 1  | Account Unmask - View Acct#  | Device Code Textbox | 12bc5634  | 6                | 125634              |
        | Interdiction User 4  | Account Unmask - View Acct#  | Device Code Textbox | 12bc5634  | 6                | 125634              |
        | Interdiction User 1  | Account Unmask - View Acct#  | Device Code Textbox | a234567b  | 6                | 234567              |
        | Interdiction User 4  | Account Unmask - View Acct#  | Device Code Textbox | a234567b  | 6                | 234567              |

# Sequence Testing - Feature should apper as per Sequence Metioned
Scenario Outline: '<FOLB Customer>' should see picklist options in mentioned Priority In case he is perfroming a High Risk Transaction and Eligible for RSA
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Label>' label
    When I click on 'Try Another Method'
    Then I should see the 'Availble Options' label
    And I validate the Sequence of picklist is correct
        | RSA SecureID               | 1  |
        | Text me with a code        | 2  |
        | Call me with a code        | 3  |
        | Enter my card PIN          | 4  |
        | Send me a email            | 5  |
    Examples:
        | FOLB Customer        | Control Point                | On Screen Label                               |
        | Interdiction User 1  | Account Unmask - View Acct#  | Enter the code from your RSA SecureID device  |
        | Interdiction User 4  | Account Unmask - View Acct#  | Enter the code from your RSA SecureID device  |

# Negative Scenario Testing - 
Scenario Outline: '<FOLB Customer>' should see error popup In case he is perfroming a High Risk Transaction and Eligible for RSA and entering wrong RSA
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Label>' label
    When I click on '<On Screen Control>' textbox
    When I enter '<Wrong RSA Token>' in '<On Screen Control>'
    And I click on 'Continue' button
    Then I see Modal Popup with Header Text "<Modal Header Text>" and Body Text as "<Modal Body Text>"
    When I click on "Modal OK Button"
    Then I should see the '<On Screen Label>' label
    Examples:
        | FOLB Customer        | Control Point                | On Screen Label                               | Wrong RSA Token | Modal Header Text | Modal Body Text                                                                                     |
        | Interdiction User 1  | Account Unmask - View Acct#  | Enter the code from your RSA SecureID device  | 123456          | Let's try again   | The code you've entered isn't correct. Please wait for your RSA SecureID device to show a new code. |
        | Interdiction User 4  | Account Unmask - View Acct#  | Enter the code from your RSA SecureID device  | 123456          | Let's try again   | The code you've entered isn't correct. Please wait for your RSA SecureID device to show a new code. |

# Positive Scenario Testing

Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default RSA as Interdiction Method, enters correct RSA, I should be landed on Target Page.
Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default OTP as Interdiction Method, enters incorrect Token and later enters correct RSA, I should be landed on Target Page.
Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default RSA as Interdiction Method, enters incorrect Token for 3 times, ?????????to check????????.
