class Factura
    def initialize(cantidad, precio_unitario)
        self.cantidad = cantidad
        self.precio_unitario = precio_unitario
    end
    attr_accessor :cantidad, :precio_unitario
    def facturar()
        neto = self.cantidad * self.precio_unitario
        impuesto = neto * 0.0825        
        total_parcial = neto + impuesto
        descuento = calcular_descuento total_parcial
        total_descuento = total_parcial * descuento/100

        total = total_parcial - total_descuento/100
        
        puts "#{self.cantidad} x $#{self.precio_unitario} = $#{neto}"
        puts "CA(%8.25) = $#{impuesto}"
        puts "DTO(%#{descuento}) = $#{total_descuento}"
        puts "Total = $#{total}"
    end

    def calcular_descuento(total)
        total_descuento = 0;
        if total > 50000
            total_descuento =  15
        end

        return total_descuento
    end
    private :calcular_descuento
end

cantidad = ARGV[0].to_i
precio_unitario = ARGV[1].to_i

factura = Factura.new cantidad, precio_unitario
factura.facturar