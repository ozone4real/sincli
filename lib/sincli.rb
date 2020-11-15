require "sincli/version"
require "thor"
require "active_support/core_ext/string"
require "sincli/utils/string"
require "sincli/generators/base"
require "sincli/generators/application"
require "sincli/generators/assets"
require "sincli/generators/config"
require "sincli/generators/executions"
require "sincli/generators/models_and_controllers"
require "sincli/generators/root_files"
require "sincli/generators/views"

module Sincli
  autoload :Generator, "sincli/generator"
end
