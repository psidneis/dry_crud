require 'rubygems' 
require 'rake'
require 'date'

DRY_CRUD_GEMSPEC = Gem::Specification.new do |spec| 
	spec.name    = 'dry_crud' 
	spec.version = File.read('VERSION').strip
	spec.date    = Date.today.to_s
	
	spec.author   = 'Pascal Zumkehr'
	spec.email    = 'spam@codez.ch' 
	spec.homepage = 'http://codez.ch/dry_crud'
		
	spec.summary = "Generates DRY and specifically extendable CRUD controller, views and helpers for Rails applications"
	spec.description = <<-END
Generates simple and extendable controller, views and helpers that support you to DRY up the CRUD code in your Rails project. Start with these elements and build a clean base to efficiently develop your application upon.
END

	readmes = FileList.new('*') do |list|
		list.exclude(/(^|[^.a-z])[a-z]+/) 
		list.exclude('TODO') 
	end.to_a 
	spec.files = FileList['lib/**/*', 'test/templates/**/*', 'Rakefile'].to_a + readmes 
    spec.add_dependency 'rails', '3.0.0.beta4'
    
	spec.has_rdoc = true 
	spec.extra_rdoc_files = readmes 
	spec.rdoc_options += [
'--title', 'Dry Crud', '--main', 'README.rdoc', '--line-numbers', '--inline-source'
] 
end