import mysql.connector

class BaseDeDatos:
    def __init__(self) -> None:
        self.connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='i2i0L2aH1',
            database='box s.a.'
        )
        self.__articulos = {}

    def verCliente(self):
        cursor = self.connection.cursor()
        cursor.execute("SELECT idClientes, Nombre FROM clientes")
        results = cursor.fetchall()
        return results

    def verProductosConCliente(self, id_cliente):
        cursor = self.connection.cursor()
        cursor.execute("SELECT CodigoInterno FROM fichasproducto WHERE idcliente = %s",(id_cliente,))
        results = cursor.fetchall()
        return results

    def revisar_stock(self, producto: str, cantidad: int):
        cursor = self.connection.cursor()
        cursor.callproc("Check_Stock_Producto", [producto, cantidad])
        results = cursor.stored_results()

        for resultado in results:
            resultado = resultado.fetchall()
            for row in resultado:
                if row[0] not in self.__articulos:
                    self.__articulos[row[0]] = 0
                self.__articulos[row[0]] += row[2] - row[3]
                if self.__articulos[row[0]] > row[2]:
                    self.__articulos = {}
                    return False
        self.__articulos = {}
        return True

    def metodos_de_pago(self):
        cursor = self.connection.cursor()
        cursor.execute("SELECT * FROM metododepago")
        results = cursor.fetchall()
        return results
    
    def generar_orden_venta(self, cliente: int, productos: list):
        cursor = self.connection.cursor()
        cursor.execute("select iddireccion from direcciones where idempresa = 1 and id = %s",(cliente,))
        direccion = cursor.fetchone()
        precios = []
        subtotal = 0
        for producto in productos:
            cursor.execute("select preciounitario * %s from fichasproducto where codigointerno = %s",(producto[1], producto[0]))
            precio_unitario = cursor.fetchone()
            precios.append(precio_unitario[0])
            subtotal += precio_unitario[0]
        
        