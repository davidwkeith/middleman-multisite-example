desc "Launch preview environment"
task :preview, :target, :verbose do |task, args|

  ENV['MM_DEBUG']  = args[:verbose] ? 'true' : ''
  ENV['MM_TARGET'] = args[:target] || 'www'
  ENV['MM_SOURCE'] = File.join('source', ENV['MM_TARGET'])

  verbose = args[:verbose] ? '--verbose' : ''
  puts "** Targeting #{ENV['MM_TARGET']} #{args[:verbose] ? 'in verbose mode' : ''}"
  fail unless system "middleman #{verbose}"
end

desc "Build the specified target"
task :'build', :target, :verbose do |task, args|

  ENV['MM_DEBUG']  = args[:verbose] ? 'true' : ''
  ENV['MM_TARGET']    = args[:target] || 'www'
  ENV['MM_BUILD_DIR'] = File.join('build', ENV['MM_TARGET'])

  puts "** Targeting #{ENV['MM_TARGET']} #{args[:verbose] ? 'in verbose mode' : ''}"
  verbose = args[:verbose] ? '--verbose' : ''
  fail unless system "middleman build #{verbose}"
end