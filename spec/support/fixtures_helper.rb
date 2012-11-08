require 'pathname'
require 'json'

module FixturesHelper

  # Returns path to the response examples
  def response_examples_path
    Pathname.new(File.dirname(__FILE__)).join('..','fixtures','response_examples')
  end

  # Returns the path for +sample_name+ response example file
  def response_example_path(sample_name)
    response_examples_path.join("#{sample_name}.xml")
  end

  # Returns a mock +sample_name+ response
  def response_example(sample_name)
    content = response_example_path(sample_name).read
    content.stub(:body).and_return(content)
    content
  end
end


RSpec.configure do |conf|
  conf.include FixturesHelper
end