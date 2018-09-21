require 'aws-sdk'

namespace :sitemap do
  desc 'Upload the sitemap files to S3'
  task upload_to_s3: :environment do
    aws_region = ENV['AWS_REGION']
    aws_bucket = ENV['AWS_S3_BUCKET']
    aws_credentials = Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])

    s3 = Aws::S3::Resource.new(region: aws_region, credentials: aws_credentials)
    s3_bucket = s3.bucket(aws_bucket)

    Dir.entries(File.join(Rails.root, 'public', 'sitemaps')).each do |file_name|
      next if ['.', '..'].include? file_name

      path = "sitemaps/#{file_name}"
      file = File.join(Rails.root, 'public', 'sitemaps', file_name)

      begin
        object = s3_bucket.object(path)
        object.upload_file(file, { acl: 'public-read'} )
      rescue Exception => ex
        raise ex
      end

      puts "Saved #{file_name} to S3"
    end
  end
end
