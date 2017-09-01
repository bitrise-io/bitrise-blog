class Buttercms::BaseController < ActionController::Base
	# You can of course change this layout to your main application layout
	# to have your blog match the rest of your site.
	layout 'buttercms/default'
	include Response
	include ExceptionHandler

	def subscribe_user
		respond_to do |format|
			if !subscribe_params[:email].eql?("")
				begin
					Gibbon::Request.lists(ENV["MAILCHIMP_LIST_ID"]).members.create(
						body: {
							email_address: subscribe_params[:email],
							status: "subscribed"
						})

					format.json{ render json: {message: "ok"}, status: :ok }
				rescue Gibbon::MailChimpError => ex
					status = ex.body[:status]
					status_text = ex.body[:title]
					case status
					when 400
						format.json{ render json: {message: "existing email"}, status: :bad_request } if status_text.eql?("Member Exists")
						format.json{ render json: {message: "invalid email"}, status: :bad_request } if status_text.eql?("Invalid Resource")
					else
						format.json{ render json: {message: "unknown error"}, status: :bad_request }
					end
				end
			else
				format.json{ render json: {message: "empty email"}, status: :bad_request }
			end
		end
	end

private

	def subscribe_params
		params.require(:base).permit(:email)
	end
end
