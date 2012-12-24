#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Bblog::Application.load_tasks

desc "run spork (via rerun)"
task :spork do
  sh "rerun --pattern '{Gemfile,Gemfile.lock,spec/spec_helper.rb,.rspec,spec/factories/*.rb,config/environment.rb,config/environments/test.rb,config/initializers/*.rb,lib/**/*.rb}' -- spork"
end
