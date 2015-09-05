# This group allows to skip running RuboCop/FoodCritic if RSpec or Test Kitchen fails.
group :red_green_refactor, :halt_on_fail => true do
  guard :rspec, :cmd => 'bundle exec rspec' do
    watch(%r{^spec/.+_spec\.rb$})
    watch('spec/spec_helper.rb')  { 'spec' }
    watch(%r{^spec/support/(.+)\.rb$})                  { 'spec' }

    # Chef recipes
    watch(%r{^attributes/(.+)\.rb$})                    { 'spec' }
    watch(%r{^definitions/(.+)\.rb$})                   { 'spec' }
    watch(%r{^files/(.+)})                              { 'spec' }
    watch(%r{^libraries/(.+)\.rb$})                     { 'spec' }
    watch(%r{^providers/(.+)\.rb$})                     { 'spec' }
    watch(%r{^resources/(.+)\.rb$})                     { 'spec' }
    watch(%r{^recipes/(.+)\.rb$})                       { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^templates/(.+)})                          { 'spec' }
    watch(%r{^Berksfile$})                              { 'spec' }
    watch(%r{^metadata\.rb$})                           { 'spec' }
  end

  guard :kitchen do
    watch(%r{^attributes/(.+)\.rb$})
    watch(%r{^definitions/(.+)\.rb$})
    watch(%r{^files/(.+)})
    watch(%r{^libraries/(.+)\.rb$})
    watch(%r{^providers/(.+)\.rb$})
    watch(%r{^resources/(.+)\.rb})
    watch(%r{^recipes/(.+)\.rb$})
    watch(%r{^templates/(.+)})
    watch(%r{^Berksfile$})
    watch(%r{^metadata\.rb$})
    watch(%r{^test/.+})
    watch(%r{^.kitchen(\.local)?.yml$})
  end

  guard :foodcritic, :cookbook_paths => '.', :cli => '--context --epic-fail ~FC015 -X spec/ test/' do
    watch(%r{^attributes/(.+)\.rb$})
    watch(%r{^definitions/(.+)\.rb$})
    watch(%r{^files/(.+)})
    watch(%r{^libraries/(.+)\.rb$})
    watch(%r{^providers/(.+)\.rb$})
    watch(%r{^resources/(.+)\.rb})
    watch(%r{^recipes/(.+)\.rb$})
    watch(%r{^templates/(.+)})
    watch(%r{^metadata\.rb$})
  end

  guard :rubocop do
    watch(%r{.+\.rb$})
    watch(%r{(?:.+/)?\.rubocop(_todo)?\.yml$}) { |m| File.dirname(m[0]) }
  end
end
