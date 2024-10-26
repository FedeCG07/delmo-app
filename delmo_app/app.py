from flask import Flask, redirect, url_for, render_template, request, jsonify
from box import *

app=Flask(__name__)
data_base = BaseDeDatos()

@app.route('/',methods=['GET', 'POST'])
def home():
    if request.method=='POST':
        cliente = request.form['cliente']
        return redirect(url_for('generar_orden', cliente = cliente))
    
    clientes = data_base.verCliente()

    if request.args.get('mensaje'):
        mensaje = request.args.get('mensaje')
    else:
        mensaje = None

    return render_template("index.html", clientes = clientes, mensaje = mensaje)

@app.route('/generar_orden', methods=['GET'])
def generar_orden():

    cliente = request.args.get('cliente')
    productos = data_base.verProductosConCliente(cliente)

    metodosdepago = data_base.metodos_de_pago()

    if request.args.get('error'):
        error = request.args.get('error')
    else:
        error = None

    return render_template("orden.html", cliente = cliente, productos = productos, error = error, metodosdepago = metodosdepago)

@app.route('/handle_post_orden', methods=['GET', 'POST'])
def handle_post_orden():
    cliente = request.form['cliente']
    productos = data_base.verProductosConCliente(cliente)
    fecha_entrega = request.form['fecha_entrega']
    empleado = request.form['empleado']
    entrega = request.form['entrega']
    metodo = request.form['metodo']

    estado_de_ordenes = []
    orden = []
    for producto in productos:
        cantidad = request.form[f'cantidad_{producto[0]}']
        if cantidad:
            cantidad = int(cantidad)
            estado_de_ordenes.append(data_base.revisar_stock(producto[0], cantidad))
            orden.append((producto[0], cantidad))

    if all(estado_de_ordenes):
        data_base.generar_orden_venta(cliente, orden)
        return redirect(url_for('home', mensaje='Orden generada exitosamente'))
    else:
        return redirect(url_for('generar_orden', cliente = cliente, productos = productos, error = 'No hay suficiente stock para la orden'))
    


if __name__ == '__main__':
    app.run(port=5000,debug=True)