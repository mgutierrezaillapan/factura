class Factura
    def initialize(cantidad, precio_unitario, estado)
        self.cantidad = cantidad
        self.precio_unitario = precio_unitario
        self.estado = estado
    end
    attr_accessor :cantidad, :precio_unitario, :estado
    def facturar()
        neto = self.cantidad * self.precio_unitario

        tasa_impuesto = calcular_impuesto self.estado
        total_impuesto = neto * tasa_impuesto/100
        
        total_parcial = neto + total_impuesto
        
        descuento = calcular_descuento total_parcial
        
        total_descuento = total_parcial * descuento/100

        total = total_parcial - total_descuento/100
        
        puts "#{self.cantidad} x $#{self.precio_unitario} = $#{neto}"
        puts "#{estado}(%#{tasa_impuesto}) = $#{total_impuesto}"
        puts "DTO(%#{descuento}) = $#{total_descuento}"
        puts "Total = $#{total}"
    end

    private
    def calcular_descuento(total)
        total_descuento = 0
        if total > 50000
            total_descuento =  15
        elsif total > 10000
            total_descuento = 10
        elsif total > 7000
            total_descuento = 7
        elsif total > 5000
            total_descuento = 5
        elsif total > 1000
            total_descuento = 3
        end

        return total_descuento
    end

    def calcular_impuesto(estado)
        total_impuesto = 0

        if estado == "CA"
            total_impuesto = 8.25
        elsif estado == "UT"
            total_impuesto = 6.85
        elsif estado == "NV"
            total_impuesto = 8
        elsif estado == "TX"
            total_impuesto = 6.25
        elsif estado == "AL"
            total_impuesto = 4
        end        

        return total_impuesto
    end
end

cantidad = ARGV[0].to_i
precio_unitario = ARGV[1].to_i
estado = ARGV[2]

factura = Factura.new cantidad, precio_unitario, estado
factura.facturar