When /^I run mosaic (.*)$/ do |args|
  run(unescape("../../bin/mosaic #{args}"), false)
end