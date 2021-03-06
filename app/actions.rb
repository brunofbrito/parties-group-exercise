require 'rack-flash'
require 'csv'
require 'sinatra/redirect_with_flash'
enable :sessions
use Rack::Flash

# list of all parties
get '/' do
  if params[:query]
  	@parties = Party.where("lower(name) LIKE ?", "%#{params[:query].downcase}%")
  elsif params[:sort] == "asc"
  	@parties = Party.order(:starts_at)
  elsif params[:sort] == "desc"
  	@parties = Party.order(starts_at: :desc)
  else
  	@parties = Party.all
  end
  erb :index

end

# form to create a new party

get '/new' do
	@party = Party.new
	erb :new
end

# method to save a new party, the /new route should point here
post '/create' do
	@party = Party.new({
		name: params[:name],
		address: params[:address],
		lat: params[:lat],
		long: params[:long],
		starts_at: params[:starts_at]
		})

	if @party.save
		redirect '/', notice: 'Party created'
	else
		erb :new
	end
end

# show individual party
get '/:id' do
	@party = Party.find(params[:id])
	@attendees = @party.attendees
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
  if params[:name].empty?
	 redirect "/#{params[:id]}", error: 'Attendee field empty'
  else
    Attendee.create(name: params[:name], email: params[:email], party_id: params[:id])
    redirect "/#{params[:id]}", notice: 'Attendee successfuly added'
  end
end


# route to delete users attendess 
get '/:party_id/:id/remove_attendee' do
	Attendee.destroy(params[:id])
	redirect "/#{params[:party_id]}", notice: 'Attendee removed'
end

get '/:party_id/export' do
  party = Party.find(params[:party_id])
party.export_txt
 redirect "/#{params[:party_id]}"
end

post '/:party_id/import' do
  import = params[:import] #:import é uma hash
  party = Party.find(params[:party_id])
  if params[:import]
    party.import_csv(import[:tempfile]) 
    # O tempfile é o caminho para o ficheiro após o upload (params quando importam é uma hash) - tempfile faz parte da hash :file)
    redirect "/#{params[:party_id]}"
  else
    redirect "/#{params[:party_id]}", error: 'Please add a CSV file!'
  end
end
