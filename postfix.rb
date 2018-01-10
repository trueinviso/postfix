require "rubygems"
require "bundler/setup"
Bundler.require(:default)
require "./lib/standard_input_utility"

StandardInputUtility.read
