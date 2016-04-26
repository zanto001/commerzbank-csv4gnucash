Then(/^column (\d+) in row (\d+) should be "([^"]*)"$/
    ) do |column, row, expected|
  output = all_commands[-1].stdout
  data = CSV.parse(output)
  field = data[row.to_i - 1][column.to_i - 1]
  expect(field || '').to eq(expected)
end

Given(/^I convert "([^"]*)" to CRLF line terminators$/) do |filename|
  Dir.chdir('tmp/aruba') do
    c = File.readlines(filename).map(&:chomp).join("\r\n")
    File.write(filename, c)
  end
end
