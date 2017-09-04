module ApplicationHelper
	def svg(filename)
		puts filename
		svg_file_content = Rails.application.assets_manifest.find_sources(filename + '.svg').first

		return raw(svg_file_content) if svg_file_content
		return "(svg not found)"
	end
end
