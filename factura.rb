class Factura
    ESTADO_IMPUESTO = Hash["CA" => 8.25, "UT" => 6.85, "NV" => 8, "TX"=> 6.25, "AL" => 4]
    DESCUENTOS = Hash[ 50000 => 15, 10000 => 10, 7000 => 8, 5000 => 5, 1000 => 3]

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

        DESCUENTOS.sort_by {|k,v| v}.reverse.each do |key, tasa|
            if(total > key)
                total_descuento = tasa
                break
            end
        end
    
        return total_descuento
    end

    def calcular_impuesto(estado)
        total_impuesto = 0

        if(ESTADO_IMPUESTO.has_key? estado)
            total_impuesto =  ESTADO_IMPUESTO[estado]
        end
  
        return total_impuesto
    end
end

cantidad = ARGV[0].to_i
precio_unitario = ARGV[1].to_i
estado = ARGV[2]

factura = Factura.new cantidad, precio_unitario, estado
factura.facturar