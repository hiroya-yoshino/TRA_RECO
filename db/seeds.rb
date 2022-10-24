if Rails.env.production?
  require './db/fixtures/production/seed_data.rb'
else
  require './db/fixtures/development/seed_data.rb'
end