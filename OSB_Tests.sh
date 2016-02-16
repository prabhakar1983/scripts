#Sample Request to OSB:

#Match:
  echo -n "Enter OSB username: " && read username && echo -n "Enter OSB password: " && read password && echo -n "env: [-qa, -stg, empty for prod]" && read env && osb_auth_token=`curl -X POST -i "https://maxcvservices${env}.dnb.com/rest/Authentication" -H "x-dnb-user: ${username}" -H "x-dnb-pwd: ${password}" | grep "Authorization"` && curl -X GET -H "ApplicationID: 42" -H "SubscriberNumber: 701900009" -H "AlternateSystemUserID: 0" -H "SubscriberCountryISOAlpha2Code: US" -H "ContractStartDate: 2016-01-21T02:00:00.000-06:00" -H "IsTrial: true" -H "${osb_auth_token}" "https://maxcvservices${env}.dnb.com/V4.0/organizations?CountryISOAlpha2Code=US&SubjectName=IBM&match=true&CandidateMaximumQuantity=1"


#Score History Custom Report:
  echo -n "Enter OSB username: " && read username && echo -n "Enter OSB password: " && read password && echo -n "env: [-qa, -stg, empty for prod]" && read env && osb_auth_token=`curl -X POST -i "https://maxcvservices${env}.dnb.com:443/rest/Authentication" -H "x-dnb-user: ${username}" -H "x-dnb-pwd: ${password}" | grep "Authorization"` && curl -X GET -H "ApplicationID: 42" -H "SubscriberNumber: 701900009" -H "AlternateSystemUserID: 0" -H "SubscriberCountryISOAlpha2Code: US" -H "ContractStartDate: 2016-01-21T02:00:00.000-06:00" -H "IsTrial: true" -H "${osb_auth_token}" "https://maxcvservices${env}.dnb.com:443/V1.0/scorehistory/getscorehistory?DunsNumber=001005003&CountryISOAlpha2Code=US&ApplicationTransactionID=TestDefectPT1"


#Report:
  echo -n "Enter OSB username: " && read username && echo -n "Enter OSB password: " && read password && echo -n "env: [-qa, -stg, empty for prod]" && read env && osb_auth_token=`curl -X POST -i "https://maxcvservices${env}.dnb.com:443/rest/Authentication" -H "x-dnb-user: ${username}" -H "x-dnb-pwd: ${password}" | grep "Authorization"` && curl -X GET -H "ApplicationID: 42" -H "SubscriberNumber: 701900009" -H "AlternateSystemUserID: 0" -H "SubscriberCountryISOAlpha2Code: US" -H "ContractStartDate: 2016-01-21T02:00:00.000-06:00" -H "IsTrial: true" -H "${osb_auth_token}" "https://maxcvservices${env}.dnb.com:443/V3.0/organizations/001005003/products/DCP_STD"



#Linkage :
  echo -n "Enter OSB username: " && read username && echo -n "Enter OSB password: " && read password && echo -n "env: [-qa, -stg, empty for prod]" && read env && osb_auth_token=`curl -X POST -i "https://maxcvservices${env}.dnb.com:443/rest/Authentication" -H "x-dnb-user: ${username}" -H "x-dnb-pwd: ${password}" | grep "Authorization"` && curl -X GET -H "ApplicationID: 42" -H "SubscriberNumber: 701900009" -H "AlternateSystemUserID: 0" -H "SubscriberCountryISOAlpha2Code: US" -H "ContractStartDate: 2016-01-21T02:00:00.000-06:00" -H "IsTrial: true" -H "${osb_auth_token}" "https://maxcvservices${env}.dnb.com:443/V3.1/organizations/081466849/products/LNK_FF?InclusionDataDescription-1=IncludeIncompleteData&InclusionDataDescription-2=IncludeUndeliverableAddressSubject&InclusionDataDescription-3=IncludeNonMarketableSubject&FamilyTreeMemberRoleCode-1=9159&FamilyTreeMemberRoleCode-3=12771&FamilyTreeMemberRoleCode-4=12773&FamilyTreeMemberRoleCode-5=12774&FamilyTreeMemberRoleCode-6=12775&FamilyTreeMemberRoleCode-7=15388"



#GMS:
#  -   Get Registrations:
          echo -n "Enter OSB username: " && read username && echo -n "Enter OSB password: " && read password && echo -n "env: [-qa, -stg, empty for prod]" && read env && osb_auth_token=`curl -X POST -i "https://maxcvservices${env}.dnb.com:443/rest/Authentication" -H "x-dnb-user: ${username}" -H "x-dnb-pwd: ${password}" | grep "Authorization"` && curl -X GET -H "ApplicationID: 42" -H "SubscriberNumber: 701900009" -H "AlternateSystemUserID: 0" -H "SubscriberCountryISOAlpha2Code: US" -H "ContractStartDate: 2016-01-21T02:00:00.000-06:00" -H "IsTrial: true" -H "${osb_auth_token}" "https://maxcvservices${env}.dnb.com:443/V2.0/gmsmonitoring/registrations?ApplicationID=42&UserID=17013199&CustomerID=701001836&ApplicationTransactionID=xyz"


#GBS:
  echo -n "Enter OSB username: " && read username && echo -n "Enter OSB password: " && read password && echo -n "env: [-qa, -stg, empty for prod]" && read env && osb_auth_token=`curl -X POST -i -v "https://maxcvservices${env}.dnb.com:443/rest/Authentication" -H "x-dnb-user: ${username}" -H "x-dnb-pwd: ${password}" | grep "Authorization"`



