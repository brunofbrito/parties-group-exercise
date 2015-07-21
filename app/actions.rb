require 'rack-flash'
require 'sinatra/redirect_with_flash'
enable :sessions
use Rack::Flash

# list of all parties
get '/' do
  @parties = Party.all
  erb :index
end
# form to create a new party
get '/new' do
	erb :new
end

# method to save a new party, the /new route should point here
post '/create' do
	Party.create({
		name: params[:name],
		address: params[:address],
		lat: params[:lat],
		long: params[:long],
		starts_at: params[:starts_at]
		})
	redirect '/', notice: 'Party created'
end
# show individual post
get '/:id' do
	@party = Party.find(params[:id])
	@attendee = Attendee.all
	erb :show
end

# form to edit a single party
get '/:id/edit' do
	@party = Party.find(params[:id])
	erb :edit
end

post '/:id/edit' do
	Party.update(params[:id], params.slice("name", "address", "lat", "long", "starts_at"))
	redirect '/', notice: 'Party updated'
 end



# method to update an existing party, the /:id/edit should point here
post '/:id/update' do
end

# method to remove an existing party
get '/:id/remove' do
  Party.destroy(params[:id])
  redirect "/", notice: 'Party Removed'
end

# route to add users to party
post '/add_attendee/:id' do
	email_exists = Attendee.where(email: params[:email]).exists?
	if email_exists
		flash[:notice] = 'Error the email you are using is already registered for the party'
	else
		Attendee.create(name: params[:name], email: params[:email], party_id: params[:id])
	end
	redirect "/#{params[:id]}"
end


# route to delete users attendess 
get '/:party_id/:id/remove_attendee' do
	Attendee.destroy(params[:id])
	redirect "/#{params[:party_id]}", notice: 'Attendee removed'
end
