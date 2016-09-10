require 'yaml'

config = YAML.load_file(File.join(__dir__, 'config.yml'))
DB = Sequel.connect(config)
