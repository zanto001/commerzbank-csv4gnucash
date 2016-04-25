Then(/^column (\d+) in row (\d+) should be "([^"]*)"$/
    ) do |column, row, expected|
  output = all_commands[-1].stdout
  data = CSV.parse(output, col_sep: ';')
  field = data[row.to_i - 1][column.to_i - 1]
  expect(field).to eq(expected)
end
