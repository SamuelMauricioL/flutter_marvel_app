# Marvel app

Aplicación realizada en Flutter 💙 alimentada por el API de Marvel.

## Arquitectura

- Esta aplicación usa Clean Architecture impulsada por features, esto quiere decir que en cada /feature están presentes las capas de la arquitectura(Data, Domain, Presentation).

<img width="143" alt="Screenshot 2023-05-01 at 05 32 56" src="https://user-images.githubusercontent.com/67238016/235441208-a5f19f5a-08b6-4c23-9f81-11ea15f238a5.png">

- Además se está usando una capa /core para todas aquellas clases y funciones que queramos reusar en cada una de las capas de la arquitectura.

<img width="143" alt="Screenshot 2023-05-01 at 05 33 45" src="https://user-images.githubusercontent.com/67238016/235441260-f8a61bef-0105-4f4c-b016-2673971004cb.png">

- Manejo de estados: flutter_bloc.
- Injección de dependencias: get_it.
- Seguridad: flutter_dotenv, flutter_secure_storage & crypto.
- Manejo de errores(error handling): oxidized.
- Navegación: flow_builder el cual es usado con flutter_bloc para la navegación a travéz de estados y eventos.
- Manejo de cache: flutter_cache_manager

## Demo
https://user-images.githubusercontent.com/67238016/235441609-0b782037-52a0-42b4-b31d-15a9cb4d35e5.mp4

