#!/usr/bin/env ruby

# Configure pry
require 'pry'
Pry.config.prompt = proc { |*args| 'DinoCatalog > ' }

# Load project libraries
PROJECT_ROOT = File.dirname(__FILE__)
$LOAD_PATH.unshift(PROJECT_ROOT)
Dir["#{PROJECT_ROOT}/lib/**/**.rb"].each do |file|
  require file
end

# Setup DinoCatalog
DinoCatalog = DinoDex::Catalog.new(DinoDex::Dinosaur)
DinoCatalog.import(*Dir["#{PROJECT_ROOT}/data/**/**.csv"])

# Setup REPL
DinoCatalog.instance_eval %{ binding.pry }
