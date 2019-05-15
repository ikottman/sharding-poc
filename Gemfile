source 'https://rubygems.org'

ruby '2.6.3'

gem 'rails', '~> 6.0.0.rc1'
gem 'puma', '~> 3.11'
gem 'mysql2', '~> 0.5.2'
# so we can hot-reload in docker in production mode
gem 'listen', '>= 3.0.5', '< 3.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end