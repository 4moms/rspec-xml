# rspec-xml
[![Gem Version](https://badge.fury.io/rb/rspec-xml.svg)](http://badge.fury.io/rb/rspec-xml)
[![Build Status](https://travis-ci.org/4moms/rspec-xml.svg?branch=master)](https://travis-ci.org/4moms/rspec-xml)

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
xml = Nokogiri::XML::Builder.new do |xml|
        xml.send("inner", "stuff", "Country" => "USA", "City" => "New York")
      end.to_xml

xml.should have_xpath('//some_xml/inner').with_text('stuff').with_attr({"Country" => "USA", "City" =>"New York"})
```
