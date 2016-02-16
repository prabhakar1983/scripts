
# This script will delete Messages from AWS SQS - incase you want to delete them in batch for valid reasons.
# This script will delete 100 messages. 10 times, in batches of 10 messages.

# Define variables
deleteCount=1;
startDate=$(date);
IFS=",";

# Extract Messages Handles. The response would be a COMMA seperated SQS Message Handles.
for i in {1..10}; do
         receiptHandles=$(aws sqs receive-message --region=us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/186502235371/dnbiGMSDeRegistrationstg --attribute-names All --message-attribute-names All –       max-number-of-messages 10 | python -c 'import sys, json; response = json.load(sys.stdin); messageHandle0=response["Messages"][0]["ReceiptHandle"]; messageHandle1=response["Messages"][1]["ReceiptHandle"];    messageHandle2=response["Messages"][2]["ReceiptHandle"]; messageHandle3=response["Messages"][3]["ReceiptHandle"]; messageHandle4=response["Messages"][4]["ReceiptHandle"];  messageHandle5=response["Messages"][5]["ReceiptHandle"]; messageHandle6=response["Messages"][6]["ReceiptHandle"]; messageHandle7=response["Messages"][7]["ReceiptHandle"];  messageHandle8=response["Messages"][8]["ReceiptHandle"]; messageHandle9=response["Messages"][9]["ReceiptHandle"]; print "%s,%s,%s,%s,%s,%s,%s,%s,%s,%s" %    (messageHandle0,messageHandle1,messageHandle2,messageHandle3,messageHandle4,messageHandle5,messageHandle6,messageHandle7,messageHandle8,messageHandle9); ');

        # Tokenize the Message Handles, and Delete the Messages one by one.
        for receiptHandle in $receiptHandles; do
               aws sqs delete-message --region=us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/186502235371/dnbiGMSDeRegistrationstg --receipt-handle $receiptHandle; 
               deleteCount=`expr $deleteCount + 1`;
                echo $deleteCount;
         done

done

# Print Time Taken.
endDate=$(date);
echo "Start Date" $startDate;
echo "End Date" $endDate;
echo "Messages Deleted:" $deleteCount;
