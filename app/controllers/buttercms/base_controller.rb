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
					encoded_authorization_token = "Basic " + Base64.strict_encode64("slapec:#{ENV['MAILCHIMP_API_TOKEN']}")

					query = "query=" + subscribe_params[:email]
					response = RestClient::Request.execute(
						method: :get,
						url: "#{ENV['MAILCHIMP_API_SERVER']}/search-members?#{query}",
						headers: {
							"Authorization": encoded_authorization_token
						}
					)
					response_body = JSON.parse(response.body)
					if response_body["exact_matches"]["total_items"] > 0
						format.json{ render json: {message: "already subscribed"}.to_json(), status: :ok }
					end

					response = RestClient::Request.execute(
						method: :post,
						url: "#{ENV['MAILCHIMP_API_SERVER']}/lists/#{ENV['MAILCHIMP_LIST_ID']}/members",
						headers: {
							"Authorization": encoded_authorization_token,
							"Content-Type": "application/json"
						},
						payload: {
							email_address: subscribe_params[:email],
							status: "subscribed"
						}.to_json()
					)
					format.json{ render json: {message: "ok"}.to_json(), status: :ok }
				rescue RestClient::ExceptionWithResponse
					format.json{ render json: {message: "invalid email"}.to_json(), status: :internal_server }
				end
			else
				format.json{ render json: {message: "empty email"}.to_json(), status: :bad_request }
			end
		end
	end

private

	def subscribe_params
		params.require(:base).permit(:email)
	end
end
