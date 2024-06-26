{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "*",
        "Resource": "arn:aws:s3:::${bucket_name}/*",
        "Principal": {
            "AWS": [
                "${group_arn}"
            ]
        }
      }
    ]
}