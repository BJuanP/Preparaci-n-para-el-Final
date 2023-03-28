

Accion Facturas Es
Ambiente

FECHA = Registro
    dd:
    mm:
    aa:
FinRegistro

Facturas = Registro
    NroCliente
    NroFactura
    Fecha: FECHA
    Importe
FinRegistro

Clientes = Registro
    NroCliente
    Nombre
    DNI
    CUIT
    Domicilio
FinRegistro

ArchFac: Archivo de Facturas ordenado por NroCliente
ArchCli: Archivo de Clientes indexado por NroCliente

RegFac: Facturas
RegCli: Clientes

ResNroCli: Clientes

PROCESO

ABRIR E/(ArchFac)
ABRIR E/(ArchCli)
Leer(ArchFac, RegFac)

Escribir("|NroCliente| |Nombre Cliente| |Numero Factura|");


Mientras NFDA(ArchFac) hacer

    ResNroCli:= RegFac.NroCliente
    RegClie.NroCliente:= RegFac.NroCliente
    Leer(ArchCli, RegCli)

    Si existe entonces

        TotFact:= 0
        CantFact:= 0

        Mientras NFDA(ArchFac) y (ResNroCli = RegFac.NroCliente) hacer

            TotFact:= TotFact + Importe
            CantFact:= CantFact + 1
            
            Leer(ArchFac, RegFac)
        
        FinMientras

        Escribir(RegCli.NroCliente, RegCli.Nombre, TotFact, CantFact)

    Sino
        Escribir("ERROR. Cliente no existente")

        Mientras NFDA(ArchFac) y (ResNroCli = RegFac.NroCliente) hacer

            Leer(ArchFac, RegFac)
        
        FinMientras
    FinSi

FinMientras

CERRAR(todo)

FinAccion.