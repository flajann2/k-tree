# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: k-tree 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "k-tree"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Fred Mitchell"]
  s.date = "2014-09-15"
  s.description = "\n  This is a data structure to represent and manage k-trees,\n  primarily created for use in RubyNEAT, but may see other possible applications.\n  The goal here is to be roebust in the creation of your k-tree, to allow\n  you to prune during creation, since, especially for higher-dimensional trees,\n  the number of leaf node can become very large.\n\n  So a parent will have children nodes created down to the desired resolution,\n  and immediately after the creation of the children, will check to see if there's\n  enough variance among the children to keep them. If not, they are pruned immediately.\n  "
  s.email = "lordalveric@yahoo.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".semver",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "lib/k-tree.rb",
    "lib/k-tree/k-tree.rb",
    "spec/k-tree_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/flajann2/k-tree"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0")
  s.rubygems_version = "2.2.2"
  s.summary = "K-Tree is a generalization of quadtrees and octrees."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2"])
      s.add_development_dependency(%q<yard>, ["~> 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3"])
      s.add_development_dependency(%q<bundler>, ["~> 1"])
      s.add_development_dependency(%q<jeweler>, ["~> 2"])
      s.add_development_dependency(%q<simplecov>, ["~> 0"])
      s.add_development_dependency(%q<semver>, ["~> 1"])
      s.add_development_dependency(%q<guard-rspec>, ["~> 0"])
    else
      s.add_dependency(%q<rspec>, ["~> 2"])
      s.add_dependency(%q<yard>, ["~> 0"])
      s.add_dependency(%q<rdoc>, ["~> 3"])
      s.add_dependency(%q<bundler>, ["~> 1"])
      s.add_dependency(%q<jeweler>, ["~> 2"])
      s.add_dependency(%q<simplecov>, ["~> 0"])
      s.add_dependency(%q<semver>, ["~> 1"])
      s.add_dependency(%q<guard-rspec>, ["~> 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2"])
    s.add_dependency(%q<yard>, ["~> 0"])
    s.add_dependency(%q<rdoc>, ["~> 3"])
    s.add_dependency(%q<bundler>, ["~> 1"])
    s.add_dependency(%q<jeweler>, ["~> 2"])
    s.add_dependency(%q<simplecov>, ["~> 0"])
    s.add_dependency(%q<semver>, ["~> 1"])
    s.add_dependency(%q<guard-rspec>, ["~> 0"])
  end
end
