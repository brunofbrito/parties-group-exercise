require 'rack-flash'
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

get '/:party_id/export' do
  party = Party.find(params[:party_id])
  File.open("#{party.name}.txt", "w") do |f|
    party.attendees.each do |attendee|
      f << "#{attendee.name}\n"
    end
  end
  redirect "/#{params[:party_id]}"
end

get '/:party_id/import' do
  party = Party.find(params[:party_id])
  CSV.open("#{party.name}.txt", "r") do |f|
    csv = CSV.parse(filename, :headers => true) do |row|
    	Attendee.create!(row.to_hash)
    	end 
    # party.attendees.each do |attendee|
      # f << "#{attendee.name}\n"
   
  end
  redirect "/#{params[:party_id]}"
end