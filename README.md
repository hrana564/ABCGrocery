# ABCGrocery

om Product Owner.
 - like how to check account is blocked.
 - like what happens after 10 times requesting otp.
 - like what happends after 3 time incorrect RSA token is entered.
 - How transaction successfull screen looks.
 - What is transaction timeout time & OTP Expirty Time. RSA expirty time is assumed to be 1 mins???
 - screen what happens when incorrect OTP is entered
 - How will appium access RSA token
 New Details required from Product Owner
How to characterize a high risk transaction and Low risk transaction
What is the lable to identify Transaction Perfrom page in case user clicks on cancel button

for below Scenario.. where do we see.. account no 
Scenario Outline: '<FOLB Customer>' should see Interdiction Screen In case he is perfroming a High Risk Transaction, account number should be masked.
--oone more point ... for testing scenarios for multiple customer types.. we need below  types of users in test.. we might already have.. ust need credentials
# 1) User with RSA Auth Enabled and No OTP Auth Enabled with Eligible Mobile Number : Interdiction User 1
# 2)User  with RSA Auth Disabled and OTP Auth Enabled with Eligible Mobile Number : Interdiction User 2 (??????????need eligible mobile Number??????????)
# 3)User  with RSA Auth Disabled and No Elibilbe OTP Mobile Number : Interdiction User 3
# 4)User  with RSA Auth Enabled and Elibilbe OTP Mobile Number : Interdiction User 4 (??????????need eligible mobile Number??????????)
