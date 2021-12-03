require 'csv'

filepath = '/home/campos1984/code/AnaPaula0712/Qual-vai-ser/db/reveillon_nordeste.csv'

CSV.foreach(filepath) do |row|
  # Here, row is an array of columns
  puts "#{row[0]} | #{row[1]} | #{row[2]}"
end
