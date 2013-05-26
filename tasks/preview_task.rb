require "middleman-core/cli/server"

# Preview thor task
class Preview < Thor
  include Thor::Invocation

  namespace :preview

  desc 'preview TARGET [options]', 'Start the preview server for TARGET'
  method_option :environment,
    :aliases => "-e",
    :default => ENV['MM_ENV'] || ENV['RACK_ENV'] || 'development',
    :desc    => "The environment Middleman will run under"
  method_option :host,
    :type    => :string,
    :aliases => "-h",
    :default => "0.0.0.0",
    :desc    => "Bind to HOST address"
  method_option :port,
    :aliases => "-p",
    :default => "4567",
    :desc    => "The port Middleman will listen on"
  method_option :verbose,
    :type    => :boolean,
    :default => false,
    :desc    => 'Print debug messages'
  method_option :instrument,
    :type    => :string,
    :default => false,
    :desc    => 'Print instrument messages'
  method_option :disable_watcher,
    :type    => :boolean,
    :default => false,
    :desc    => 'Disable the file change and delete watcher process'
  method_option :profile,
    :type    => :boolean,
    :default => false,
    :desc    => 'Generate profiling report for server startup'
  method_option :reload_paths,
    :type    => :string,
    :default => false,
    :desc    => 'Additional paths to auto-reload when files change'
  method_option :force_polling,
    :type    => :boolean,
    :default => false,
    :desc    => 'Force file watcher into polling mode'

  # Start the server
  def preview(target='www')
    ENV['MM_TARGET'] = target
    ENV['MM_SOURCE'] = File.join('source', target)

    puts "== Targeting #{target.green}"
    invoke Middleman::Cli::Server, ['server']
  end

  def self.exit_on_failure?
    true
  end

end
