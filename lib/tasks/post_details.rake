desc "Prints the details of the posts to the standard output"
task :post_details, [:page_size, :page_index] => :environment do |t, args|
	page_size = args.page_size ? args.page_size : 100
	page_index = args.page_index ? args.page_index : 1
	posts = ButterCMS::Post.all(page_size: page_size, page: page_index)

	puts "\e[36m========================\e[0m"
	posts.each_with_index do |post, index|
		puts "\e[35mPublish date:\e[0m #{post.published}"
		puts "\e[32mSlug:\e[0m #{post.slug}"
		puts "\e[32mTitle:\e[0m #{post.title}"
		puts "\e[32mDescription:\e[0m #{post.summary}"
		puts "\e[36m========================\e[0m"
	end
end
