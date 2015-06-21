# encoding: utf-8

require 'rubygems'
require 'bundler'
require 'semver'

def s_version
  SemVer.find.format "%M.%m.%p%s"
end

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "k-tree"
  gem.homepage = "http://github.com/flajann2/k-tree"
  gem.license = "MIT"
  gem.summary = %Q{K-Tree is a generalization of quadtrees and octrees.}
  gem.description = %Q{
  This is a data structure to represent and manage k-trees,
  primarily created for use in RubyNEAT, but may see other possible applications.
  The goal here is to be roebust in the creation of your k-tree, to allow
  you to prune during creation, since, especially for higher-dimensional trees,
  the number of leaf node can become very large.

  So a parent will have children nodes created down to the desired resolution,
  and immediately after the creation of the children, will check to see if there's
  enough variance among the children to keep them. If not, they are pruned immediately.
  }
  gem.email = "fred.mitchell@gmx.de"
  gem.authors = ["Fred Mitchell"]
  gem.required_ruby_version = '>= 2.0'
  gem.version = s_version
  gem.files.exclude 'foo/**/*', 'rdoc/*',
                    '.idea/**/*', '.idea/**/.*', '.yardoc/**/*',
                    'Guardfile'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['spec'].execute
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new
