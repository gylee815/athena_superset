CREATE EXTERNAL TABLE cloudtrail_logs_partitioned(
  eventversion string, 
  useridentity struct<type:string,principalid:string,arn:string,accountid:string,invokedby:string,accesskeyid:string,username:string,sessioncontext:struct<attributes:struct<mfaauthenticated:string,creationdate:string>,sessionissuer:struct<type:string,principalid:string,arn:string,accountid:string,username:string>>>,
  eventtime string, 
  eventsource string, 
  eventname string, 
  awsregion string, 
  sourceipaddress string, 
  useragent string, 
  errorcode string, 
  errormessage string, 
  requestparameters string, 
  responseelements string, 
  additionaleventdata string, 
  requestid string, 
  eventid string, 
  resources array<struct<arn:string,accountid:string,type:string>>, 
  eventtype string, 
  apiversion string, 
  readonly string, 
  recipientaccountid string, 
  serviceeventdetails string, 
  sharedeventid string, 
  vpcendpointid string )
PARTITIONED BY ( 
  region string, 
  year string, 
  month string, 
  day string)
ROW FORMAT SERDE 
  'com.amazon.emr.hive.serde.CloudTrailSerde' 
STORED AS INPUTFORMAT 
  'com.amazon.emr.cloudtrail.CloudTrailInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://gstest-cloudtrail/AWSLogs/400329627099/CloudTrail/'
;
