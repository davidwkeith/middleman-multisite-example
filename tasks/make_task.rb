require "middleman-core/cli/build"

# Preview thor task
class Make < Thor
  include Thor::Invocation

  namespace :make

  desc 'make TARGET [options]', 'Builds the static site under TARGET for deployment'
  method_option :clean,
    :type    => :boolean,
    :default => true,
    :desc    => 'Remove orphaned files from build (--no-clean to disable)'
  method_option :glob,
    :type    => :string,
    :aliases => "-g",
    :default => nil,
    :desc    => 'Build a subset of the project'
  method_option :verbose,
    :type    => :boolean,
    :default => false,
    :desc    => 'Print debug messages'
  method_option :instrument,
    :type    => :string,
    :default => false,
    :desc    => 'Print instrument messages'
  method_option :profile,
    :type    => :boolean,
    :default => false,
    :desc    => 'Generate profiling report for the build'

  # make the site
  def make(target='www')
    ENV['MM_TARGET'] = target
    ENV['MM_SOURCE'] = File.join('source', target)

    puts "== Targeting #{target.green}"
    invoke Middleman::Cli::Build, ['build']
  end

end
