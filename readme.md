# rspec-xml
*spec your xml*

## installation
```ruby Gemfile
gem 'rspec-xml'
```

## Usage
```ruby some_spec.rb
"<something>else</something>".should have_xpath('/something').with_text('else')
```
