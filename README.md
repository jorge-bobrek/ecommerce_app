
# Los Recuerdos De Ella

## Resumen del Proyecto
"Los Recuerdos De Ella" es una aplicación de tienda en línea desarrollada con Flutter. El proyecto hace uso de los paquetes `fake_store_api_package` y `fake_store_widgets_package` para manejar los llamados al API y el sistema de diseño basado en atomic design, respectivamente.

## Estructura de la Aplicación

```
lib/
    main.dart
    features/
        account/
            presentation/
                pages/
                    account_page.dart
        authentication/
            data/
                models/
                    user_model.dart
            presentation/
                pages/
                    login_page.dart
                    register_page.dart
                providers/
                    user_provider.dart
        cart/
            domain/
                entities/
                    cart_item_entity.dart
            presentation/
                pages/
                    cart_page.dart
                providers/
                    cart_provider.dart
                widgets/
                    add_to_cart_widget.dart
                    cart_control_widget.dart
                    quantity_controls_widget.dart
        home/
            presentation/
                pages/
                    home_page.dart
                widgets/
                    featured_products_widget.dart
                    product_card_widget.dart
                    promotion_banner.dart
                    promotions_widget.dart
        product/
            data/
                mappers/
                    product_mapper.dart
            presentation/
                pages/
                    main_page.dart
                    product_detail_page.dart
                    search_page.dart
                providers/
                    product_provider.dart
                widgets/
                    app_bar_widget.dart
                    category_dropdown_widget.dart
                    product_list_widget.dart
        support/
            presentation/
                pages/
                    support_page.dart
```

## Descripción de las Carpetas y Archivos

1. **main.dart**
   - Punto de entrada de la aplicación.

2. **features/**
   - Carpeta principal que contiene todas las funcionalidades de la aplicación divididas en módulos.

3. **account/**
   - **presentation/pages/account_page.dart**: Página que muestra la información de la cuenta del usuario.

4. **authentication/**
   - **data/models/user_model.dart**: Modelo de datos que representa al usuario.
   - **presentation/pages/login_page.dart**: Página de inicio de sesión.
   - **presentation/pages/register_page.dart**: Página de registro.
   - **presentation/providers/user_provider.dart**: Proveedor para manejar el estado del usuario.

5. **cart/**
   - **domain/entities/cart_item_entity.dart**: Entidad que representa un ítem en el carrito.
   - **presentation/pages/cart_page.dart**: Página del carrito de compras.
   - **presentation/providers/cart_provider.dart**: Proveedor para manejar el estado del carrito.
   - **presentation/widgets/**:
     - **add_to_cart_widget.dart**: Widget para agregar ítems al carrito.
     - **cart_control_widget.dart**: Widget para controlar el carrito.
     - **quantity_controls_widget.dart**: Widget para controlar la cantidad de ítems.

6. **home/**
   - **presentation/pages/home_page.dart**: Página principal de la tienda.
   - **presentation/widgets/**:
     - **featured_products_widget.dart**: Widget para mostrar productos destacados.
     - **product_card_widget.dart**: Widget para mostrar tarjetas de productos.
     - **promotion_banner.dart**: Widget para mostrar banners de promoción.
     - **promotions_widget.dart**: Widget para mostrar promociones.

7. **product/**
   - **data/mappers/product_mapper.dart**: Mapeador para transformar datos de productos.
   - **presentation/pages/**:
     - **main_page.dart**: Página principal de productos.
     - **product_detail_page.dart**: Página de detalles del producto.
     - **search_page.dart**: Página de búsqueda de productos.
   - **presentation/providers/product_provider.dart**: Proveedor para manejar el estado de los productos.
   - **presentation/widgets/**:
     - **app_bar_widget.dart**: Widget para la barra de aplicaciones.
     - **category_dropdown_widget.dart**: Widget para seleccionar categorías.
     - **product_list_widget.dart**: Widget para mostrar listas de productos.

8. **support/**
   - **presentation/pages/support_page.dart**: Página de soporte al cliente.

## Funcionalidades Implementadas

1. **Autenticación**: Permite a los usuarios registrarse, iniciar sesión y gestionar su cuenta.
2. **Carrito de Compras**: Los usuarios pueden agregar ítems al carrito, modificar cantidades y proceder al pago.
3. **Exploración de Productos**: Los usuarios pueden buscar y explorar productos, ver detalles y añadirlos al carrito.
4. **Promociones y Ofertas**: Muestra productos destacados y promociones en la página principal.
5. **Soporte al Cliente**: Los usuarios pueden acceder a una página de soporte para obtener ayuda.

## Uso de Paquetes

- **fake_store_api_package**: Utilizado para realizar llamados al API de Fake Store.
- **fake_store_widgets_package**: Utilizado para implementar un sistema de diseño basado en atomic design, facilitando la reutilización de componentes visuales.
