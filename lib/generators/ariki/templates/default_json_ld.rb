# config/initializers/default_meta.rb

# Initialize default JSON+LD.
DEFAULT_JSON_LD = YAML.load_file(Rails.root.join("config/json_ld.yml"))