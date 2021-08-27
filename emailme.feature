Feature: ###JIRA Ticket Number### As a ABCGroceryStore mobile app customer having OTP Enabled and I want to perfrom a High Risk Transaction and verify it is Routed through On email OTP Interdiction Scree.

Interdiction is a Control Point where user is highlighted that the transaction he is doing posseses a higher risk.
As part of this change user will now be directley routed to user default Authentication methond On email OTP.
In case user wants to change the authentication method, he/she will still have "Try Another Method" button to swtich to a different method.

# We need Test Username and PWD for Below type of Users:
# 1) with RSA Auth Disabled and OTP Auth Disabled and Email Auth with Eligible Email ID & InEligibel Email ID's with Other Auth Enabled : Interdiction User 1
# 2) with RSA Auth Disabled and OTP Auth Disabled and Email Auth with Eligible Email ID & No InEligibel Email ID's with Other Auth Enabled : Interdiction User 2 
# 3) with RSA Auth Disabled and OTP Auth Disabled and Email Auth with Eligible Email ID with No other Auth Enabled : Interdiction User 3
# 4) with RSA Auth Disabled and OTP Auth Disabled and No Email Auth Enabled i.e All In Eligible Email IDs : Interdiction User 4

# Conditional Testing - Feature should apper basis on specific conditions

Scenario Outline: '<FOLB Customer>' should see Interdiction Screen In case he is perfroming a High Risk Transaction
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Label>' label
    Examples:
        | FOLB Customer        | Control Point                  | On Screen Label                      |
        | Interdiction User 1  | Account Unmask - View Acct#    | We'll email you with one-time code.  |
        | Interdiction User 2  | Account Unmask - View Acct#    | We'll email you with one-time code.  |
        | Interdiction User 3  | Account Unmask - View Acct#    | We'll email you with one-time code.  |
        | Interdiction User 1  | Rewards - Consumer in-session  | We'll email you with one-time code.  |
        | Interdiction User 2  | Rewards - Consumer in-session  | We'll email you with one-time code.  |
        | Interdiction User 3  | Rewards - Consumer in-session  | We'll email you with one-time code.  |

Scenario Outline: '<FOLB Customer>' "Try Another Menthod" Button should not be present In case he is perfroming a High Risk Transaction and Eligible only for 1 Auth - Email OTP
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Label>' label
    Then I should not see the 'Try Another Method' Button
    Examples:
        | FOLB Customer        | Control Point                  | On Screen Label                      |
        | Interdiction User 3  | Account Unmask - View Acct#    | We'll email you with one-time code.  |
        | Interdiction User 3  | Rewards - Consumer in-session  | We'll email you with one-time code.  |

# Exit Functionality Testing - In case user wants to exit the functionality from any screen
Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default Email OTP as Interdiction Method, click close button(X on top right of screen), Intediction Screen Should Close.
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Label>' label
    When I click on 'Top Right Cross Button'
    Then I should see the "<Control Point>" lable
    Examples:
        | FOLB Customer        | Control Point                  | On Screen Label                      |
        | Interdiction User 1  | Account Unmask - View Acct#    | We'll email you with one-time code.  |
        | Interdiction User 2  | Account Unmask - View Acct#    | We'll email you with one-time code.  |
        | Interdiction User 3  | Account Unmask - View Acct#    | We'll email you with one-time code.  |
        | Interdiction User 1  | Rewards - Consumer in-session  | We'll email you with one-time code.  |
        | Interdiction User 2  | Rewards - Consumer in-session  | We'll email you with one-time code.  |
        | Interdiction User 3  | Rewards - Consumer in-session  | We'll email you with one-time code.  |


Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default Email OTP as Interdiction Method, click close button(X on top right of screen), Intediction Screen Should Close.
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Label>' label
    When I click on "<Email ID>" from Moblile Number list
    When I click on 'Top Right Cross Button'
    Then I should see the "<Control Point>" lable
    Examples:
        | FOLB Customer        | Control Point                  | On Screen Label                      | Email ID          |
        | Interdiction User 1  | Account Unmask - View Acct#    | We'll email you with one-time code.  | ****abcd@xyz****  |
        | Interdiction User 2  | Account Unmask - View Acct#    | We'll email you with one-time code.  | ****abcd@xyz****  |
        | Interdiction User 3  | Account Unmask - View Acct#    | We'll email you with one-time code.  | ****abcd@xyz****  |
        | Interdiction User 1  | Rewards - Consumer in-session  | We'll email you with one-time code.  | ****abcd@xyz****  |
        | Interdiction User 2  | Rewards - Consumer in-session  | We'll email you with one-time code.  | ****abcd@xyz****  |
        | Interdiction User 3  | Rewards - Consumer in-session  | We'll email you with one-time code.  | ****abcd@xyz****  |

# Screen Object/User Interface Testing - Verify that all the Controls/labels/images/objects are present on screen
Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default email OTP Interdiction Method, I should see all the Controls/labels/images/objects On Screen.
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control 1>' label
    And I should see the '<On Screen Control 2>' label
    And I should see the '<On Screen Control 3>' label
    And I should see the '<On Screen Control 4>' label
    And I should see the '<On Screen Control 5>' label
    And I should see the '<On Screen Control 6>' label
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1                  | On Screen Control 2                                                                  | On Screen Control 3                | On Screen Control 4  | On Screen Control 5  | On Screen Control 6  |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll email you with one-time code.  | By continuing, you agree that we can send you the code using the number you select.  | Message and data rates may apply.  | Select one           | Try Another Method   | Unavailble Emails    |

Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default email OTP Interdiction Method, I should see all the Controls/labels/images/objects On Screen.
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control 1>' label
    And I should see the '<On Screen Control 2>' label
    And I should see the '<On Screen Control 3>' label
    And I should see the '<On Screen Control 4>' label
    And I should see the '<On Screen Control 5>' label
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1                  | On Screen Control 2                                                                  | On Screen Control 3                 | On Screen Control 4  | On Screen Control 5  |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll email you with one-time code.  | By continuing, you agree that we can send you the code using the number you select.  |  Message and data rates may apply.  | Select one           | Try Another Method   |

Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default email OTP Interdiction Method, I should see all the Controls/labels/images/objects On Screen.
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control 1>' label
    And I should see the '<On Screen Control 2>' label
    And I should see the '<On Screen Control 3>' label
    And I should see the '<On Screen Control 4>' label
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1                  | On Screen Control 2                                                                  | On Screen Control 3                 | On Screen Control 4  |
        | Interdiction User 3  | Account Unmask - View Acct#  | We'll email you with one-time code.  | By continuing, you agree that we can send you the code using the number you select.  |  Message and data rates may apply.  | Select one           |


# User Interaction Testing - Verify that Email OTP email Box is User interactive. i.e on click Keypad is activated.
Scenario Outline: '<FOLB Customer>' while perfroming a High Risk Transaction and Eligible for Email OTP, while entering OTP value in textbox, he should see numeric keypad.
Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control 1>' label
    When I click on "<Email ID>" from Moblile Number list
    Then I should see the '<On Screen Control 2>' label
    And I should see the '<On Screen Control 3>' textbox
    When I click on '<On Screen Control 3>' textbox
    Then I should see the 'Numeric' keypad
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1                  | Email ID          | On Screen Control 2                                                                         | On Screen Control 3  |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | A code was sent to ****abcd@xyz**** by email message.  | OTP Textbox          |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | A code was sent to ****abcd@xyz**** by email message.  | OTP Textbox          |
        | Interdiction User 3  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | A code was sent to ****abcd@xyz**** by email message.  | OTP Textbox          |

Scenario Outline: '<FOLB Customer>' while perfroming a High Risk Transaction and Eligible for Email OTP, continue button should only be enabled when 6 digits are entered
Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control 1>' label
    When I click on "<Email ID>" from Moblile Number list
    Then I should see the '<On Screen Control 2>' label
    And I should see the '<On Screen Control 3>' textbox
    When I click on '<On Screen Control 3>' textbox
    And I enter '<OTP Code>' in '<On Screen Control 3>'
    Then I should see the 'Continue Button Control' as '<Continue Button Status>'
    When I enter '#BACKSPACE#' in '<On Screen Control>'
    Then I should see the 'Continue Button Control' as 'disabled'
    When I enter '1' in '<On Screen Control 3>'
    Then I should see the '<On Screen Control 3>' as '<Continue Button Status>'
        Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1                  | Email ID          | On Screen Control 2  | On Screen Control   | OTP Code  | Continue Button Status |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 123       | disabled               |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 123       | disabled               |
        | Interdiction User 3  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 123       | disabled               |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 123456    | enabled                |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 123456    | enabled                |
        | Interdiction User 3  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 123456    | enabled                |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 12345678  | enabled                |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 12345678  | enabled                |
        | Interdiction User 3  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 12345678  | enabled                |

Scenario Outline: '<FOLB Customer>' while perfroming a High Risk Transaction and Eligible for Email OTP, user should not be able to enter more than 6 digits and alphabets/special chars.
Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control 1>' label
    When I click on "<Email ID>" from Moblile Number list
    Then I should see the '<On Screen Control 2>' label
    And I should see the '<On Screen Control 3>' textbox
    When I click on '<On Screen Control 3>' textbox
    And I enter '<OTP Code>' in '<On Screen Control 3>'
    Then I see lenght of characters in '<On Screen Control 3>' is '<Length OTP Code>'
    And I see value of '<On Screen Control 3 >' is '<On Screen OTP Code>'
    When I clear '<On Screen Control 2>' textbox
    And I paste '<OTP Code>' in '<On Screen Control 3>'
    Then I see lenght of characters in '<On Screen Control 3 >' is '<Length OTP Code>'
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1                  | Email ID          | On Screen Control 2  | On Screen Control   | OTP Code  | Length OTP Code  | On Screen OTP Code  |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 123       | 3                | 123                 |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 123       | 3                | 123                 |
        | Interdiction User 3  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 123       | 3                | 123                 |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 123456    | 6                | 123456              |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 123456    | 6                | 123456              |
        | Interdiction User 3  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 123456    | 6                | 123456              |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 12345678  | 6                | 123456              |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 12345678  | 6                | 123456              |
        | Interdiction User 3  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 12345678  | 6                | 123456              |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 123a      | 3                | 123                 |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 123a      | 3                | 123                 |
        | Interdiction User 3  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 123a      | 3                | 123                 |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 12bc5634  | 6                | 125634              |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 12bc5634  | 6                | 125634              |
        | Interdiction User 3  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | 12bc5634  | 6                | 125634              |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | a234567b  | 6                | 234567              |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | a234567b  | 6                | 234567              |
        | Interdiction User 3  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | a234567b  | 6                | 234567              |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | #234%67$  | 5                | 23467               |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | #234%67$  | 5                | 23467               |
        | Interdiction User 3  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           | OTP Textbox         | #234%67$  | 5                | 23467               |

# Sequence Testing - Feature should apper as per Sequence Metioned
Scenario Outline: '<FOLB Customer>' should see picklist options in mentioned Priority In case he is perfroming a High Risk Transaction and Eligible for OTP
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control 1>' label
    When I click on "<Email ID>" from Moblile Number list
    Then I should see the '<On Screen Control 2>' label
    When I click on 'Try Another Method'
    Then I should see the 'Availble Options' label
    And I validate the Sequence of picklist is correct
        | Text me with a code        | 1  |
        | email me with a code        | 2  |
        | Enter my card PIN          | 3  |
        | Send me a email            | 4  |
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1                  | Email ID          | On Screen Control 2  |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | Enter code           |


Scenario Outline: '<FOLB Customer>' should see Eligilble Email IDs In case he is perfroming a High Risk Transaction and Eligible for OTP
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control 1>' label
    And I validate the Sequence of 'Eligible Email IDs' is correct
        | ****abcd@xyz****  | Home |
        | ****pqrs@xyz****  | Work |
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1                  |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll email you with one-time code.  |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll email you with one-time code.  |
        | Interdiction User 3  | Account Unmask - View Acct#  | We'll email you with one-time code.  |

Scenario Outline: '<FOLB Customer>' should see Eligilble Email IDs In case he is perfroming a High Risk Transaction and Eligible for OTP
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Control 1>' label
    And I validate the Sequence of 'Unavailable Numbers' is correct
        | ****oth1@xyz****  | Mobile |
        | ****oth2@xyz****  | Home   |
    Examples:
        | FOLB Customer        | Control Point                | On Screen Control 1                  |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll email you with one-time code.  |

# Negative Scenario Testing - 
Scenario Outline: '<FOLB Customer>' should see error popup In case he is perfroming a High Risk Transaction and Eligible for Email OTP and entering wrong OTP
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Label 1>' label
    When I click on "<Email ID>" from Moblile Number list
    Then I should see the '<On Screen Control>' label
    When I click on '<On Screen Control>' textbox
    When I enter '<Wrong OTP>' in '<On Screen Control>'
    And I click on 'Continue' button
    Then I see Modal Popup with Header email "<Modal Header Text>" and Body email as "<Modal Body Text>"
    When I click on "Modal OK Button"
    Then I should see the '<On Screen Label>' label
    Examples:
        | FOLB Customer        | Control Point                | On Screen Label 1                    | Email ID          | On Screen Control   | Wrong OTP       | Modal Header email | Modal Body email                                                                                     |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | OTP Textbox         | 123456          | Let's try again   | The code you've entered isn't correct. |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | OTP Textbox         | 123456          | Let's try again   | The code you've entered isn't correct. |
        | Interdiction User 3  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | OTP Textbox         | 123456          | Let's try again   | The code you've entered isn't correct. |


Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Email OTP as Interdiction Method, enters incorrect OTP and later again enters incorrect OTP
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Label 1>' label
    When I click on "<Email ID>" from Moblile Number list
    Then I should see the '<On Screen Control>' label
    When I click on '<On Screen Control>' textbox
    When I enter '<Wrong OTP>' in '<On Screen Control>'
    And I click on 'Continue' button
    Then I see Modal Popup with Header email "<Modal Header Text>" and Body email as "<Modal Body Text>"
    When I click on "Modal OK Button"
    Then I should see the '<On Screen Label>' label
    When I click on '<On Screen Control>' textbox
    When I enter '<Wrong OTP>' in '<On Screen Control>'
    And I click on 'Continue' button
    Then I see Modal Popup with Header email "<Modal Header Text>" and Body email as "<Modal Body Text>"
    When I click on "Modal OK Button"
    Examples:
        | FOLB Customer        | Control Point                | On Screen Label 1                    | Email ID          | On Screen Control   | Wrong OTP       | Modal Header email | Modal Body email                       |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | OTP Textbox         | 123456          | Let's try again    | The code you've entered isn't correct. |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | OTP Textbox         | 123456          | Let's try again    | The code you've entered isn't correct. |
        | Interdiction User 3  | Account Unmask - View Acct#  | We'll email you with one-time code.  | ****abcd@xyz****  | OTP Textbox         | 123456          | Let's try again    | The code you've entered isn't correct. |


Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Email OTP as Interdiction Method, and requests for new OTP and enters it incorrectly.
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Label 1>' label
    When I click on "<Email ID>" from Moblile Number list
    Then I should see the '<On Screen Control>' label
    When I click on '<On Screen Control>' textbox
    When I enter '<Wrong OTP>' in '<On Screen Control>'
    And I click on 'Continue' button
    Then I see Modal Popup with Header email "<Modal Header email 2>" and Body email as "<Modal Body email 2>"
    When I click on "Modal OK Button"
    When I click on "Get a New Code"
    Then I see Modal Popup with Header email "<Modal Header email 1>" and Body email as "<Modal Body email 1>"
    When I click on "Modal OK Button"
    Then I should see the '<On Screen Label>' label
    When I click on '<On Screen Control>' textbox
    When I enter '<Wrong OTP>' in '<On Screen Control>'
    And I click on 'Continue' button
    Then I see Modal Popup with Header email "<Modal Header email 2>" and Body email as "<Modal Body email 2 >"
    When I click on "Modal OK Button"
    Examples:
        | FOLB Customer        | Control Point                | On Screen Label 1                    | On Screen Control   | Wrong OTP  | Modal Header email 1 | Modal Body email 1          | Modal Header email 2 | Modal Body email 2                      |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll email you with one-time code.  | OTP textbox         | 123456     | Success              | We've sent you a new code   | Let's try again      | The code you've entered isn't correct.  |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll email you with one-time code.  | OTP textbox         | 123456     | Success              | We've sent you a new code   | Let's try again      | The code you've entered isn't correct.  |
        | Interdiction User 3  | Account Unmask - View Acct#  | We'll email you with one-time code.  | OTP textbox         | 123456     | Success              | We've sent you a new code   | Let's try again      | The code you've entered isn't correct.  |

Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Email OTP as Interdiction Method, and requests for new OTP and enters previous OTP.
    Given I am logged in to ABCGroceryStore Online Banking as '<FOLB Customer>'
    When I navigate to '<Control Point>' page
    Then I should see the '<On Screen Label 1>' label
    When I click on "<Email ID>" from Moblile Number list
    Then I should see the '<On Screen Control>' label
    And Save the received OTP in "#CLIPBOARD#"
    When I click on "Get a New Code"
    Then I see Modal Popup with Header email "<Modal Header email 1>" and Body email as "<Modal Body email 1>"
    When I click on "Modal OK Button"
    Then I should see the '<On Screen Label>' label
    When I click on '<On Screen Control>' textbox
    When I enter '#CLIPBOARD#' in '<On Screen Control>'
    And I click on 'Continue' button
    Then I see Modal Popup with Header email "<Modal Header email 2>" and Body email as "<Modal Body email 2>"
    When I click on "Modal OK Button"
    Examples:
        | FOLB Customer        | Control Point                | On Screen Label 1                    | On Screen Control   | Wrong OTP  | Modal Header email 1 | Modal Body email 1          | Modal Header email 2 | Modal Body email 2                      |
        | Interdiction User 1  | Account Unmask - View Acct#  | We'll email you with one-time code.  | OTP textbox         | 123456     | Success              | We've sent you a new code   | Let's try again      | The code you've entered isn't correct.  |
        | Interdiction User 2  | Account Unmask - View Acct#  | We'll email you with one-time code.  | OTP textbox         | 123456     | Success              | We've sent you a new code   | Let's try again      | The code you've entered isn't correct.  |
        | Interdiction User 3  | Account Unmask - View Acct#  | We'll email you with one-time code.  | OTP textbox         | 123456     | Success              | We've sent you a new code   | Let's try again      | The code you've entered isn't correct.  |

# Positive Scenario Testing

Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default OTP as Interdiction Method, and enters OTP correctly, transaction should be successful.
Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default OTP as Interdiction Method, and requests for new OTP and enters it correctly, transaction should be successful.
Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default OTP as Interdiction Method, enters incorrect otp, should be notified and allowed to re-enter / re-request OTP.
Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default OTP as Interdiction Method, and requests for new OTP for more than 10 times, ?????????to check????????.
Scenario Outline: '<FOLB Customer>' perfroming a High Risk Transaction and Having Default OTP as Interdiction Method, enters incorrect otp for 3 times, should be blocked ???????? to check ???????.
