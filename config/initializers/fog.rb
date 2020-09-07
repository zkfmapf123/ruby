CarrierWave.configure do |config|
    config.fog_provider="fog/aws"
    config.fog_credentials = {
        provider: "AWS",
        aws_access_key_id: "#{ENV["AWS_ACCESS_KEY"]}",
        aws_secret_access_key: "#{ENV["AWS_SECRET_ACCESS_KEY"]}",
        region: "#{ENV["AWS_REGION"]}",
        endpoint: "#{ENV["AWS_S3_END_POINT"]}"
    }

    config.fog_directory="donggyu-s3"
    config.fog_public = true
    config.fog_attributes= {}

    #이미지를 가진게시글 삭제 시 aws s3서버에도 자동삭제처리
    config.remove_previously_stored_files_after_update =true
end