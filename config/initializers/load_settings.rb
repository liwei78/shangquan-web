# ADMIN_SETTINGS = YAML.load_file(File.join(Rails.root.to_s, "config", "admin.yml"))[Rails.env]
SITE_SETTINGS = YAML.load_file(File.join(Rails.root.to_s, "config", "site_settings.yml"))[Rails.env]