When /^I run mosaic (.*)$/ do |args|
  run(unescape("../../bin/mosaic #{args}"), false)
end

Then /^the output should contain the grid:$/ do |output|
  combined_output.strip.should include(output.strip)
end
