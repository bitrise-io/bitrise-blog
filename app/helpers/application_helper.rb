module ApplicationHelper
	def svg(filename)
		svg_file_content = Rails.application.assets_manifest.find_sources(filename + '.svg').first
		return raw(svg_file_content) if svg_file_content
		return "(svg not found)"
	end

	def html_escape_characters(text)
		expressions_to_replace = [
			["&quot;", "\""],
			["&#39;", "'"]
		]

		expressions_to_replace.each do |exp|
			text = text.gsub(exp.first, exp.last)
		end

		return text
	end
end
