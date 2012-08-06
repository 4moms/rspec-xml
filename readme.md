# rspec-xml
*spec your xml*

## installation
```ruby
gem 'rspec-xml'
```

## Usage
```ruby
"<something>else</something>".should have_xpath('/something').with_text('else')
```
