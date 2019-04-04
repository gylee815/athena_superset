ALTER TABLE cloudtrail_logs_partitioned ADD 
PARTITION (region='ap-northeast-2',year='2019',month='02',day='01') location 's3://bucket_name/AWSLogs/Account_Number/CloudTrail//ap-northeast-2/2019/02/01'
PARTITION (region='ap-northeast-2',year='2019',month='02',day='02') location 's3://bucket_name/AWSLogs/Account_Number/CloudTrail//ap-northeast-2/2019/02/02'
;