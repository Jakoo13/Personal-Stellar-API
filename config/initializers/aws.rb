require 'aws-sdk-s3'

AWS_CLIENT = Aws.config.update(
    region:               'us-east-1',
    access_key_id:        Rails.application.credentials.dig(:aws, :access_key_id),
    secret_access_key:    Rails.application.credentials.dig(:aws, :secret_access_key)
  )


