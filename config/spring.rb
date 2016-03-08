setup_sqlite_db = lambda do
  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
  load "#{Rails.root}/db/schema.rb" # use db agnostic schema by default
end

Spring.after_fork do
  silence_stream(STDOUT, &setup_sqlite_db) if Rails.env.test?
end
