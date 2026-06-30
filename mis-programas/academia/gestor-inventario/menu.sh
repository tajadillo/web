#!/usr/bin/env bash

DIR="$(cd "$(dirname "$0")" && pwd)"

menu_crear_editar() {
  while true; do
    clear
    echo "╔══════════════════════════════════════╗"
    echo "║     INVENTARIO — CREAR Y EDITAR      ║"
    echo "╠══════════════════════════════════════╣"
    echo "║  1)  Crear tablas                    ║"
    echo "║  2)  Insertar artículo               ║"
    echo "║  3)  Editar artículo                 ║"
    echo "║  4)  Insertar categoría              ║"
    echo "║  5)  Editar categoría                ║"
    echo "║  6)  Insertar proveedor              ║"
    echo "║  7)  Editar proveedor                ║"
    echo "║  8)  Registrar movimiento (ent/sal)  ║"
    echo "║  9)  Crear pedido                    ║"
    echo "║ 10)  Eliminar registro               ║"
    echo "║ 11)  Vaciar tabla                    ║"
    echo "║ 12)  Eliminar toda la BD             ║"
    echo "║                                      ║"
    echo "║  0)  Volver al menú principal        ║"
    echo "╚══════════════════════════════════════╝"
    echo ""
    read -p "  Opción: " opcion
    echo ""

    case $opcion in
      1) bash "$DIR/scripts/crear-tablas.sh" ;;
      2)
        bash "$DIR/scripts/consultar.sh" categorias 2>/dev/null | head -10
        bash "$DIR/scripts/consultar.sh" proveedores 2>/dev/null | head -10
        echo ""
        read -p "Nombre: " nombre
        read -p "ID categoría: " cat_id
        read -p "Descripción: " desc
        read -p "ID proveedor: " prov_id
        read -p "Precio compra: " p_compra
        read -p "Precio venta: " p_venta
        read -p "Stock mínimo: " s_min
        read -p "Stock actual: " s_act
        read -p "Ubicación (ej: Estante A-3): " ubic
        bash "$DIR/scripts/insertar.sh" articulo "$nombre" "$cat_id" "$desc" "$prov_id" "$p_compra" "$p_venta" "$s_min" "$s_act" "$ubic"
        ;;
      3)
        bash "$DIR/scripts/consultar.sh" articulos
        read -p "ID del artículo: " id
        bash "$DIR/scripts/editar.sh" articulo "$id"
        ;;
      4)
        read -p "Nombre categoría: " nombre
        read -p "Descripción: " desc
        bash "$DIR/scripts/insertar.sh" categoria "$nombre" "$desc"
        ;;
      5)
        bash "$DIR/scripts/consultar.sh" categorias
        read -p "ID de la categoría: " id
        bash "$DIR/scripts/editar.sh" categoria "$id"
        ;;
      6)
        read -p "Nombre proveedor: " nombre
        read -p "Contacto: " contacto
        read -p "Teléfono: " telefono
        read -p "Email: " email
        bash "$DIR/scripts/insertar.sh" proveedor "$nombre" "$contacto" "$telefono" "$email"
        ;;
      7)
        bash "$DIR/scripts/consultar.sh" proveedores
        read -p "ID del proveedor: " id
        bash "$DIR/scripts/editar.sh" proveedor "$id"
        ;;
      8)
        bash "$DIR/scripts/consultar.sh" articulos
        echo ""
        read -p "ID del artículo: " art_id
        read -p "Tipo (entrada/salida): " tipo
        read -p "Cantidad: " cant
        fecha=$(date +%F)
        read -p "Motivo: " motivo
        read -p "Usuario: " usuario
        bash "$DIR/scripts/insertar.sh" movimiento "$art_id" "$tipo" "$cant" "$fecha" "$motivo" "$usuario"
        ;;
      9)
        bash "$DIR/scripts/consultar.sh" proveedores
        echo ""
        read -p "ID proveedor: " prov_id
        fecha=$(date +%F)
        read -p "Monto total: " total
        bash "$DIR/scripts/insertar.sh" pedido "$prov_id" "$fecha" "" "pendiente" "$total"
        ;;
      10)
        bash "$DIR/scripts/consultar.sh" articulos
        echo ""
        bash "$DIR/scripts/consultar.sh" categorias
        echo ""
        bash "$DIR/scripts/consultar.sh" proveedores
        echo ""
        read -p "Tabla (articulos/categorias/proveedores/movimientos/pedidos): " tabla
        read -p "ID del registro: " id
        bash "$DIR/scripts/eliminar.sh" registro "$tabla" "$id"
        ;;
      11)
        read -p "Tabla a vaciar: " tabla
        bash "$DIR/scripts/eliminar.sh" tabla "$tabla"
        ;;
      12)
        bash "$DIR/scripts/eliminar.sh" todo
        ;;
      0) break ;;
      *) echo -e "\e[0;31m\033[1mOpción inválida.\033[0m\e[0m" ;;
    esac

    echo ""
    read -p "Presiona Enter para continuar..."
  done
}

menu_ver_buscar() {
  while true; do
    clear
    echo "╔══════════════════════════════════════╗"
    echo "║    INVENTARIO — VER Y BUSCAR         ║"
    echo "╠══════════════════════════════════════╣"
    echo "║  1)  Ver artículos                   ║"
    echo "║  2)  Ver categorías                  ║"
    echo "║  3)  Ver proveedores                 ║"
    echo "║  4)  Ver movimientos                 ║"
    echo "║  5)  Ver pedidos                     ║"
    echo "║  6)  Inventario completo              ║"
    echo "║  7)  Stock bajo                      ║"
    echo "║  8)  Valor del inventario            ║"
    echo "║  9)  Estadísticas                    ║"
    echo "║ 10)  Buscar en tabla                 ║"
    echo "║ 11)  Respaldar base de datos         ║"
    echo "║                                      ║"
    echo "║  0)  Volver al menú principal        ║"
    echo "╚══════════════════════════════════════╝"
    echo ""
    read -p "  Opción: " opcion
    echo ""

    case $opcion in
      1) bash "$DIR/scripts/consultar.sh" articulos ;;
      2) bash "$DIR/scripts/consultar.sh" categorias ;;
      3) bash "$DIR/scripts/consultar.sh" proveedores ;;
      4) bash "$DIR/scripts/consultar.sh" movimientos ;;
      5) bash "$DIR/scripts/consultar.sh" pedidos ;;
      6) bash "$DIR/scripts/reportes.sh" inventario ;;
      7) bash "$DIR/scripts/consultar.sh" stock_bajo ;;
      8) bash "$DIR/scripts/reportes.sh" valor ;;
      9) bash "$DIR/scripts/reportes.sh" estadisticas ;;
      10)
        read -p "Tabla (articulos/categorias/proveedores/movimientos/pedidos): " tabla
        read -p "Término: " termino
        bash "$DIR/scripts/consultar.sh" buscar "$tabla" "$termino" | head -30
        ;;
      11) bash "$DIR/scripts/backup.sh" ;;
      0) break ;;
      *) echo -e "\e[0;31m\033[1mOpción inválida.\033[0m\e[0m" ;;
    esac

    echo ""
    read -p "Presiona Enter para continuar..."
  done
}

while true; do
  clear
  echo "╔══════════════════════════════════════╗"
  echo "║   GESTOR INVENTARIO — BODEGA         ║"
  echo "║   Escuela de Danza                   ║"
  echo "╠══════════════════════════════════════╣"
  echo "║                                      ║"
  echo "║  1)  CREAR Y EDITAR                  ║"
  echo "║      (altas, bajas, modificaciones)  ║"
  echo "║                                      ║"
  echo "║  2)  VER Y BUSCAR                    ║"
  echo "║      (consultas, reportes, backups)  ║"
  echo "║                                      ║"
  echo "║  0)  Salir                           ║"
  echo "╚══════════════════════════════════════╝"
  echo ""
  read -p "  Opción: " opcion

  case $opcion in
    1) menu_crear_editar ;;
    2) menu_ver_buscar ;;
    0)
      clear
      echo -e "\e[0;32m\033[1mHasta luego.\033[0m\e[0m"
      exit 0
      ;;
    *)
      echo ""
      echo -e "\e[0;31m\033[1mOpción inválida.\033[0m\e[0m"
      read -p "Presiona Enter para continuar..."
      ;;
  esac
done
