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
get '/:id/edit' do
	@party = Party.find(params[:id])
	erb :edit
end

post '/:id/edit' do
<<<<<<< HEAD
	Party.update(params[:id], params.slice("name", "address", "lat", "long", "starts_at"))
=======
	Party.update(params[:id], 
		params.slice("name", "address","lat","long","starts_at"))
>>>>>>> 47622336e0da2702b5f1ed3fcf6a2586b58862cc
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

# method to remove an existing party
get '/:id/remove' do
  Party.destroy(params[:id])
  redirect "/"
end