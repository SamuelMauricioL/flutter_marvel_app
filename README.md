# flutter_marvel_app

Aplicación realizada en Flutter 💙 alimentada por el API de Marvel.

## Arquitectura

Ésta aplicación usa Clean Architecture impulsada por features, esto quiere decir que en cada /feature están presentes las capas de la arquitectura(Data, Domain, Presentation).

Además se está usando una capa /core para todas aquellas clases y funciones que querramos reusar en cada una de las capas de la arquitectura.

Para el manejo de estamos estoy haciendo uso de flutter_bloc.

Para la seguridad de las credenciales estoy haciendo uso de flutter_dotenv & flutter_secure_storage & crypto.

La Injección de dependencias se está manejando con get_it.

El manejo de errores(error handling) con oxidized.

Y por parte de la navegación estoy haciendo uso de flow_builder el cual es usado con flutter_bloc para la navegación a travez de estados y eventos.

## Demo
