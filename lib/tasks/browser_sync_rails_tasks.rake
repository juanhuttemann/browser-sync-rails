require 'browser_sync_rails/runner'
require 'yaml'

namespace :browser_sync do
  desc "Starts browser sync"
  task :start do
    path = Rails.root.join('config', 'browser_sync.yml')

    options = if File.exist? path
      config = YAML.load_file(path)
      config = {} unless config
      config.symbolize_keys
    else
      {}
    end

    runner = BrowserSyncRails::Runner.new(options)
    sh runner.cli_command
  end
end
