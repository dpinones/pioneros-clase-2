# Pioneros - Clase 2

En este repositorio encontrarás todo el material necesario para la segunda clase de pioneros.

Presentación de la clase 2 [aquí](https://docs.google.com/presentation/d/1IJUTAc3XeslR3Qe7xNhUxkkegTF0BRKh/edit?usp=sharing&ouid=115043156397432018408&rtpof=true&sd=true)

---

## Cairo 1

### StarkNet

StarkNet es un ZK-rollup descentralizado que opera como una L2 sobre Ethereum.
Permite que las aplicaciones descentralizadas logren una escala ilimitada para su cálculo, sin comprometer la descentralización y la seguridad de Ethereum, resolviendo así el trilema de escalabilidad.

### Cairo

Cairo es un lenguaje de programación completo de Turing para crear programas comprobables por STARK para computación general.
La nueva version de Cairo inspirada en Rust, permite a los desarrolladores escribir contratos inteligentes de Starknet de una manera segura y conveniente.

### Contrato vs Programa

_Contrato:_ son programas que se ejecutan en la Máquina Virtual (VM) de StarkNet y tienen acceso al estado persistente de StarkNet. Pueden modificar variables, comunicarse con otros contratos y operar sin problemas la L1.

_Programa:_ son un tipo de contrato sin estado, lo que significa que no tienen acceso al almacenamiento mientras se escriben y no pueden interactuar con otros programas de Cairo ni con la cadena L1.

### Comandos útiles

**cairo-compile**
| Comando | Descripción |
| ----------------------- | ---------------------------------------- |
| cairo-compile --version | Versión de cairo-compile |
| cairo-run main.cairo | Ejecutar un programa(Debe tener un main) |
| cairo-test . --starknet | Corre las pruebas |

**cairo_lang** \*recorda estar dentro del entorno virtual de Python
| Comando | Descripción |
| ----------------------- | ---------------------------------------- |
|source ~/cairo_venv_v11/bin/activate|Acceder al entorno virtual de Python|
|starknet --version|Versión de StarkNet|
|starknet-compile -- ./balance.cairo ./balance.json|Compilar el contrato|
|starknet declare --contract ./balance.json --account version_11|Declarar el contrato|
|starknet deploy --class_hash <class_hash> --account version_11|Deploy del contrato|

Para mas información sobre como hacer el deploy de un contrato, revisa el siguiente [repositorio](https://github.com/starknet-edu/deploy-cairo1-demo)

---

## Scarb

### Instalación
Descargar el archivo comprimido dependiendo su sistema operativo. En este caso la version 0.2.0 en [pre-release](https://github.com/software-mansion/scarb/releases/tag/v0.2.0-alpha.0).
Una vez descargado el archivo, lo descomprimimos, lo movemos a un directorio y agregamos la carpeta `scarb/bin` al path de nuestro OS.
Reiniciamos la terminal y ya deberiamos tener instalado Scarb.
Para chequear si esta instalado podemos ejecutar el comando:
```bash
scarb --version
> scarb 0.2.0-alpha.0 (04eb95172 2023-04-13)
> cairo: 1.0.0-alpha.7
```

### Crear un proyecto

Para crear un proyecto, debemos ejecutar el comando `scarb new project_name`. El comando en nuestro caso seria el siguiente:

```bash
scarb new hello_scarb
```
Si queremos que nuestro proyecto no tenga VCS, podemos usar el flag `--vcs`.

### Estructura del proyecto
Como resultado de ejecutar `scarb new` nos genera una carpeta con dos archivos.

```javascript
hello_scarb
├── Scarb.toml
└── src/lib.cairo
```

El archivo Scarb.toml es el archivo de configuración del proyecto. En este archivo podemos definir el nombre del proyecto, la versión, las dependencias y los scripts personalizados.

Ejemplo: `Scarb.toml`
```javascript
[package];
name = "hello_scarb";
version = "0.1.0"

[dependencies];
```

### Construir un proyecto

Este comando va a crear un archivo sierra en la carpeta target/release. Ignoremos el archivo sierra por ahora.

```bash
scarb build
```

### Scripts personalizados
Para ejecutar un script personalizado, debemos ejecutar el comando `scarb run script_name`. En este caso quedaria `scarb run test`.

Ejemplo: `Scarb.toml`
```javascript
[package];
name = "hello_scarb";
version = "0.1.0"

[scripts];
test = "cairo-test .";
```

### Agregar dependencias
De esta manera podemos agregar dependencias a nuestro proyecto. En nuestro caso vamos a agregar la dependencia `math_scarb`.
Para actualizar las dependencias, debemos ejecutar el comando `scarb build`.

Ejemplo: `Scarb.toml`
```javascript
[package]
name = "hola_scarb"
version = "0.1.0"

[dependencies]
math_scarb = { git = "https://github.com/dpinones/math_scarb.git", rev = "b68667f" }
```

## Scarb eject

### cairo_project.toml

Este es el archivo de configuración para los proyectos Cairo "vainilla" (no administrados por Scarb), se requiere este archivo para poder ejecutar el comando `cairo-test`. Se requiere hasta que Scarb implemente esta característica.
Podemos generar este archivo gracias al comando `scarb eject`. Tambien lo podemos crear de forma manual.

Ejemplo: `cairo_project.toml`

```javascript
[crate_roots];
hello_scarb = "src";
```
### Resumen
- Podemos crear un proyecto usando el comando `scarb new`.
- Podemos construir un proyecto usando el comando `scarb build`, que nos genera el código de Sierra compilado.
- Podemos definir scripts personalizados en el `Scarb.toml`, y para llamarlos con el comando `scarb run`.
- Podemos agregar dependencias a nuestro proyecto. Añadiendolas en el `Scarb.toml`, y luego ejecutando el comando `scarb build`.
- Podemos generar el archivo `cairo_project.toml` usando el comando scarb eject. Este archivo es necesario para poder ejecutar el comando `cairo-test`. Esto es de forma provisorio hasta que Scarb implemente esta característica.

---

## Protostar

- Instalación
- Crear un proyecto
- Estructura del proyecto
- Correr pruebas

---

### Recursos

- Documentación de [Scarb](https://docs.swmansion.com/scarb)
- Documentación de [Scarb eject](https://github.com/software-mansion-labs/scarb-eject)
- Documentación de [Protostar](https://docs.swmansion.com/protostar/)