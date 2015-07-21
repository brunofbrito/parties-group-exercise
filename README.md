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
  starts_at: Time.now,
  attendee_id: 1
)

Party.create(
  name: 'Awesome Party',
  address: 'Faro',
  lat: '1.5245',
  long: '25.3221',
  starts_at: Time.now,
  attendee_id: 2
)

Party.create(
  name: 'Mega Party',
  address: 'Porto',
  lat: '1.1235',
  long: '15.1298',
  starts_at: Time.now,
  attendee_id: 2
)

Attendee.create(
    name: "Bruno",
    email: "bruno@gmail.com"
)

Attendee.create(
    name: "Ricardo",
    email: "ricardo@gmail.com"
)

Attendee.create(
    name: "Rui",
    email: "rui@gmail.com"
)
```
