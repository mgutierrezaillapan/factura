cantidad =ARGV[0].to_i
precio_unitario = ARGV[1].to_i

neto = cantidad * precio_unitario

puts "#{cantidad} x $#{precio_unitario} = $#{neto}"
puts "Total = $#{neto}"