# rspec-xml
*spec your xml*

## installation
```
# Gemfile
gem 'rspec-xml'
```

## Usage

```ruby
# some_spec.rb
"<something>else</something>".should have_xpath('/something')
"<something>else</something>".should have_xpath('/something').with_text('else')

"<something>else</something>".should_not have_xpath('/what')
"<something>else</something>".should_not have_xpath('/something').with_text('what')
```

### Builder

```ruby
xml = ''
builder = Builder::XmlMarkup.new(:target => xml)
builder.instruct!

builder.some_xml do |xml|
  xml.inner 'stuff'
end

xml.should have_xpath('//some_xml/inner').with_text('stuff')
```