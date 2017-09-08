# lib/tasks/before_assets_precompile.rake

task :before_assets_precompile do
  # run a command which starts your packaging
  system('rake npm:install')
end

# every time you execute 'rake assets:precompile'
# run 'before_assets_precompile' first
Rake::Task['assets:precompile'].enhance ['before_assets_precompile']
