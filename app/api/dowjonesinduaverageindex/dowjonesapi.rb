require 'grape'

class DOWJONESAPI < Grape::API

	prefix 'api'
	version 'v1', using: :path
	format :json
	p_symbl = nil;

	rescue_from :all do |e|
		rack_response({ message: e.message })
	end

	rescue_from ActiveRecord::RecordNotFound do |e|
		error_response({ message: e.message + ' with stock ticker ' + p_symbl.to_s, status: 404})
	end


	resource :dowjones do
		desc "Return Dow Jones industrial average index"
		get '', root: :DowJonesIndu do
			DowJonesInduAverageIndex.all
		end

		desc "Return a quote for a company"
		get '/:symbl' do
			p_symbl = params[:symbl]
			dowJonesModel = DowJonesInduAverageIndex.find_by! symbl: params[:symbl]
		end
	end

end
