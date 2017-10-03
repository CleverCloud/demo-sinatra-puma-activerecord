# frozen_string_literal: true

# Preload application is better when we run on multiple threads
preload_app!
tag 'demo-sinatra-puma-activerecord'

# Those 'before_fork' and 'on_worker_boot' hooks are recommended for
# activerecord when using preload_app
before_fork do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.connection.disconnect!
  end
end

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
