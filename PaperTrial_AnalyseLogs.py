# https://docs.dnb.com/direct/2.0/en-US/response-codes
osb_codes={
			"CM000":["Success",200],
			
			"CM001":["The given request is invalid.", 400],
			"CM002":["The format of this request is invalid.",400],
			"CM003":["Missing information in the request.",400],
			"CM004":["Internal D&B system error.",500],
			"CM005":["D&B System temporarily unavailable.", 503],
			"CM006":["D&B System busy.", 503],
			"CM007":["Your request cannot be fulfilled for the given criteria.", 404],
			"CM008":["No match found for the requested Duns number",404],
			"CM009":["Reason Code required for Germany.",400],
			"CM010":["Partial Success.", 200],
			"CM011":["Invalid Country Code provided in the request",400],
			"CM012":["Invalid Duns number provided in the request.",400],
			"CM013":["Invalid Subject ID provided in the request.",400],
			"CM014":["Invalid Product Code provided in the request",400],
			"CM016":["Invalid Territory provided in the request.",400],
			"CM017":["Duns number is missing in the request.",400],
			"CM018":["No candidates resulted for the given input criteria.",404],
			"CM022":["Only a Subset of request parameters were used for processing the request.", 200],
			"CM023":["Duplicate record cannot be created.",400],
			"CM026":["Request accepted. Processing pending.",200],
			
			"CP001":["No Match for the given input criteria.",404],
			"CP002":["No candidates resulted in the Extended Search.",404],
			"CP003":["No Match for given Telephone Number.",404],
			"CP004":["No Match for given Organization Identifier.",404],
			"CP005":["Insufficient Information to determine Fraud Score.",400],
			
			"PD001":["Requested product not available due to insufficient data." ,404],
			"PD002":["Requested subject is promised later. Preliminary report returned." ,200],
			"PD003":["Requested product not available - subject is on Stop Distribution." ,404],
			"PD004":["Requested product not available due to subject information is too old." ,404],
			"PD005":["Requested Product not available." ,404],
			"PD006":["Subject is foreign branch, therefore trade-up to HQ is not available." ,404],
			"PD007":["Family Tree does not exist for requested subject." ,404],
			"PD008":["Success. Returned truncated family tree, as family tree member count exceeds maximum limit for requested subject." ,200],
			"PD009":["Required scoring elements missing - a Commercial or Blended Small Business report is not available. You may proceed with a Principal only request." ,200],
			"PD010":["Requested Product not available as address is undeliverable." ,200],
			"PD011":["Requested Product not available as address is undeliverable." ,404],
			"PD012":["Requested Product not available on Self request." ,404],
			"PD013":["Requested Product is not available currently. Product will be delivered to the customer at a later point of time via offline delivery channels (Email/FAX/FTP etc)." ,404],
			"PD014":["Requested data is not available or partially available due to data integrity errors." ,404],
			"PD015":["Trade-up to HQ is not available. Therefore delivering the data for branch organization." ,200],
			"PD016":["Requested Product is not available since the requested DUNS is transferred to a new DUNS." ,200],
			"PD019":["The requested product is not available because the product size exceeds the maximum limit. Please use the compressed product attachment option for pulling a product of large size.	 " ,000],
			
			"SC001":["Your user credentials are invalid." ,401],
			"SC002":["Your user credentials are not eligible for this request." ,401],
			"SC003":["Your user credentials have expired." ,401],
			"SC004":["Your Subscriber number has expired." ,401],
			"SC005":["You have reached maximum limit permitted as per the contract." ,401],
			"SC006":["Transaction not processed as the permitted concurrency limit was exceeded." ,401],
			"SC007":["Subscriber validation failed." ,401],
			"SC008":["Your account has been locked out due to repeated attempts to login with an incorrect User ID/Password." ,401],
			"SC009":["Invalid Sign On Token in the request." ,401],
			"SC010":["The User ID you provided doesn\\'t exist in the system." ,000],
			"SC011":["The User ID you provided already exist in the system" ,000],
			"SC012":["Request not processed as user activation key is invalid or expired." ,000],
			"SC014":["Your user credentials are not eligible for this request since you are in trial period" ,401],
			
			"BC001":["Partial Success. One or more records in the input file were not processed." ,200],
			"BC002":["Batch request is not processed since input file is not available in the specified location." ,400],
			"BC003":["Batch request is not processed since the content of the input file is not in the expected format." ,400],
			"BC004":["Batch request is not processed since the count of the records specified in the request do not match the exact count of records in the input file." ,400],
			"BC005":["Intermediate Success" ,200],
			"BC006":["Batch request is not processed" ,400],
			"BC007":["Batch Execution in progress" ,000],
			"BC008":["Batch Execution not yet started" ,000],
			"BC009":["Batch not processed as the input file contains more records than the permitted limit." ,400],
			"BC010":["Batch files no longer available after retention period." ,200],
			"BC011":["Invalid Batch Process Id provided in the request." ,400],
			
			"MN001":["Invalid Monitoring Profile ID provided in the request." ,400],
			"MN002":["Invalid Notification Profile ID provided in the request." ,400],
			"MN003":["Product not registered for Level 2 Monitoring" ,400],
			"MN004":["Cannot delete Monitoring Profile - registrations exist" ,400],
			"MN005":["Cannot delete Notification Profile - registrations exist." ,400]
			
		}

#papertrail --min-time '5 days ago' --group 'DNBi_PRD' 'method=POST, uri=https://maxcvservices.dnb.com:443/V2.0/gmsmonitoring/registrations' > Registrations_logs_5days_PRD.log
#papertrail --min-time '5 days ago' --group 'DNBi_PRD' 'method=PUT, uri=https://maxcvservices.dnb.com:443/V2.0/gmsmonitoring/registrations' > De-Registrations_logs_5days_PRD.log
registrations_file_name="/Users/thatchinamoorthyp/Documents/UserStories/Papertrial/De-Registrations_logs_5days_PRD.log"

registrations_log_file = open(registrations_file_name)
registrations_log_lines = registrations_log_file.readlines();

print "Total Count = {}".format(len(registrations_log_lines))

result_count_dict={}
for result_code, detail in osb_codes.iteritems():
	description = detail[0]
	http_status_code = detail[1]
	for log_line in registrations_log_lines:
		if result_code in log_line:
			result_code_count = result_count_dict.get(result_code)
			if result_code_count is None:
				result_count_dict[result_code] = 1
			else:
				result_count_dict[result_code] = result_code_count + 1	

for result_code, result_count in result_count_dict.iteritems():
	print "HTTP Response Code = ", osb_codes.get(result_code)[1], "  ;  OSB Response code =", result_code, "  ;  Count=" , result_count, "  ;  Result Description = ", osb_codes.get(result_code)[0]

		
	
