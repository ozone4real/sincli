require "sincli/version"
require "thor"
require "active_support/core_ext/string"
require "sincli/utils/string.rb"
generators_dir = File.expand_path("lib/sincli/generators")
Dir.glob(File.join(generators_dir, "**", "*.rb")) do |f|
  require f
end

module Sincli
  autoload :Generators, "sincli/generators.rb"
end
