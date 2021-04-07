class Factura
    def initialize(cantidad, precio_unitario)
        self.cantidad = cantidad
        self.precio_unitario = precio_unitario
    end
    attr_accessor :cantidad, :precio_unitario
    def facturar()
        neto = self.cantidad * self.precio_unitario
        impuesto = neto * 0.0825
        total = neto + impuesto
        
        puts "#{self.cantidad} x $#{self.precio_unitario} = $#{neto}"
        puts "CA(%8.25) = $#{impuesto}"
        puts "DTO(%0) = $0"
        puts "Total = $#{total}"
    end
end

cantidad = ARGV[0].to_i
precio_unitario = ARGV[1].to_i

factura = Factura.new cantidad, precio_unitario
factura.facturar