namespace :test do
  desc "Run all tests, including system tests"
  task all: [ :test, "test:system" ]
end
