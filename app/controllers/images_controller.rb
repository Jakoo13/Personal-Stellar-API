require 'aws-sdk-s3'

class ImagesController < ApplicationController

    # Post image to S3 bucket
    def get_presigned_url
        # @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
        # render json: @s3_direct_post
        # s3 = Aws::S3::Resource.new(client: AWS_CLIENT)
        # bucket = s3.bucket('my-stellar-api-development')
        # obj = bucket.object("${filename}-#{SecureRandom.uuid}")

        # url = obj.presigned_url(:put)
        # render json: {url: url}
        # signer = Aws::S3::Presigner.new(client: AWS_CLIENT)
        # url = signer.presigned_url(
        # :put_object,
        # bucket: "my-stellar-api-development",
        # key: "uploads/#{SecureRandom.uuid}/${filename}"
        # )
        # render json: {url: url}



        # s3 = Aws::S3::Client.new(
        #     region:               'us-east-1', #or any other region
        #     access_key_id:        Rails.application.credentials.dig(:aws, :access_key_id),
        #     secret_access_key:    Rails.application.credentials.dig(:aws, :secret_access_key)
        #   )
        # signer = Aws::S3::Presigner.new(client: s3)
        # url = signer.presigned_url(
        # :put_object,
        # bucket: "my-stellar-api-development",
        # key: "uploads/#{SecureRandom.uuid}/${filename}"
        # )
        # render json: {url: url}

        work_order_id = params[:work_order_id]

        
        s3_client = Aws::S3::Client.new(AWS_CLIENT)

        unique_id = SecureRandom.uuid

        obj = Aws::S3::Object.new(
            bucket_name: 'my-stellar-api-development',
            key: "work_order_photos/#{work_order_id}/#{unique_id}",
            client: s3_client
        ).presigned_url(:put)
        render json: {url: obj}
    end

end
