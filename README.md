# Creators School Parties Group Exercise

An exercise for us to practice our Pull Request skills on Git (and Ruby. and Sinatra).


Dummy date. Run tux and paste the following code:
----------

```ruby
Party.create(
  name: 'Cool Party',
  address: 'Lisbon',
  lat: '1.2345',
  long: '5.4321',
  starts_at: Time.now
)

Party.create(
  name: 'Awesome Party',
  address: 'Faro',
  lat: '1.5245',
  long: '25.3221',
  starts_at: Time.now
)

Party.create(
  name: 'Mega Party',
  address: 'Porto',
  lat: '1.1235',
  long: '15.1298',
  starts_at: Time.now
)

Attendee.create(
    name: "Bruno",
    e-mail: "bruno@gmail.com",
    party_id: 1
)

Attendee.create(
    name: "Ricardo",
    e-mail: "ricardo@gmail.com",
    party_id: 2
)

Attendee.create(
    name: "Rui",
    e-mail: "rui@gmail.com",
    party:id: 1
)
```
