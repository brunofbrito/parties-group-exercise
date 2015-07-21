require 'rack-flash'
require 'sinatra/redirect_with_flash'
enable :sessions
<<<<<<< HEAD

=======
>>>>>>> 264d1266fc157a6c2ddd5e6945c6659fd6aa40bf
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
	redirect '/'
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
	redirect '/'
 end



# method to update an existing party, the /:id/edit should point here
post '/:id/update' do
end

# method to remove an existing party
get '/:id/remove' do
  Party.destroy(params[:id])
  redirect "/", notice: 'Removed'
end

# route to add users to party
post '/add_attendee/:id' do
	attendees = Attendee.all
	unique_email = attendees.map do |attendee|
		attendee.email
	end
	if params[:email] == unique_email
		flash[:error] = "E-mail already exists"
	else
		Attendee.create(name: params[:name], email: params[:email], party_id: params[:id])
		flash[:notice] = "Attendee successfuly addedd"
	end
	redirect "/#{params[:id]}"
end


# route to delete users attendess 
get '/:party_id/:id/remove_attendee' do
	Attendee.destroy(params[:id])
	redirect "/#{params[:party_id]}"
end
