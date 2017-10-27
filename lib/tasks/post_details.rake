desc "Prints the details of the posts to the standard output"
task :post_details => :environment do
	posts = ButterCMS::Post.all(:page_size => 10000)
	puts "\e[36m========================\e[0m"
	posts.each_with_index do |post, index|
		puts "\e[35mPost #{index+1}:\e[0m"
		puts "\e[32mSlug:\e[0m #{post.slug}"
		puts "\e[32mTitle:\e[0m #{post.title}"
		puts "\e[32mDescription:\e[0m #{post.summary}"
		puts "\e[36m========================\e[0m"
	end
end