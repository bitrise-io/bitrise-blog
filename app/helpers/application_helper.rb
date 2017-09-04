module ApplicationHelper
	def svg(filename)
		puts ">>>>>>>>>"
		puts filename
		puts filename + '.svg'
		puts asset_path(filename + '.svg')
		puts Rails.application.assets_manifest.find_sources(filename + '.svg').inspect
		Rails.application.assets_manifest.find_sources(filename + '.svg').each do |item|
			puts item.inspect
		end
		puts ">>>>>>>>>"

		svg_file_content = Rails.application.assets_manifest.find_sources(filename + '.svg').first
		return raw(svg_file_content) if svg_file_content
		return "(svg not found)"
	end
end
