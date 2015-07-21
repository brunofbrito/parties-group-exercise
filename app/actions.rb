require 'rack-flash'
use Rack::Flash

# list of all parties
get '/' do
  @parties = Party.all
  erb :index
end

# show individual post
get '/:id' do
		@party = Party.find(params[:id])
		erb :show
end

# form to edit a single party
post '/:id/edit' do
	party = Party.find(params[:id])
	party.update({
		name: params[:name],
		address: params[:adress],
		lat: params[:lat],
		long: params[:long],
		starts_at: params[:starts_at]
		})
	redirect '/'
 end

# form to create a new party
get '/new' do
end

# method to save a new party, the /new route should point here
post '/create' do
end

# method to update an existing party, the /:id/edit should point here
post '/:id/update' do
end
