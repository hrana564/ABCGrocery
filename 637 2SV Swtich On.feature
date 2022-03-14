Feature: DPDX-637 As a ABC Grocery Andriod mobile app customer having 2SV Enabled and I want to Perform Login to App and should see Interdicion.

# Users Detials

@Interdiction @2SVInterdiction
Scenario Outline: '<FOLB Customer>' Login in to App when 2SV Switch is '<2SV Switch Status>'.
    Given  '<FOLB Customer>' have 2SV Switch '<2SV Switch Status>'
    Given I am logged in to ABC Grocery Online banking as '<FOLB Customer>'
    Then I should see '<On Screen Label 1>' label
    Examples:
        | FOLB Customer       | 2SV Switch Status             | On Screen Label 1                |
        | Interdiction 1 RSA  | On, at every sign on          | Enter code from my RSA SecureID  |
        | Interdiction 1 RSA  | On, except when using our app | Account Summary                  |
        | Interdiction 1 RSA  | Off                           | Account Summary                  |

        | Interdiction 2 SMS  | On, at every sign on          | SMS Phone No Select Screen       |
        | Interdiction 2 SMS  | On, except when using our app | Account Summary                  |
        | Interdiction 2 SMS  | Off                           | Account Summary                  |

