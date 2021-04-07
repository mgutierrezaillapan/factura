cantidad =ARGV[0].to_i
precio_unitario = ARGV[1].to_i

neto = cantidad * precio_unitario
impuesto = neto * 0.0825
total = neto + impuesto

puts "#{cantidad} x $#{precio_unitario} = $#{neto}"
puts "CA(%8.25) = $#{impuesto}"
puts "Total = $#{total}"