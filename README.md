# Pioneros - Clase 2
En este repositorio encontrarás todo el material necesario para la segunda clase de pioneros.

Presentación de la clase 2 [aquí](https://docs.google.com/presentation/d/1IJUTAc3XeslR3Qe7xNhUxkkegTF0BRKh/edit?usp=sharing&ouid=115043156397432018408&rtpof=true&sd=true)

### Cairo 1

#### StarkNet
StarkNet es un ZK-rollup descentralizado que opera como una L2 sobre Ethereum. 
Permite que las aplicaciones descentralizadas logren una escala ilimitada para su cálculo, sin comprometer la descentralización y la seguridad de Ethereum, resolviendo así el trilema de escalabilidad.

#### Cairo
Cairo es un lenguaje de programación completo de Turing para crear programas comprobables por STARK para computación general.
La nueva version de Cairo inspirada en Rust, permite a los desarrolladores escribir contratos inteligentes de Starknet de una manera segura y conveniente.


#### Contrato vs Programa
*Contrato:* son programas que se ejecutan en la Máquina Virtual (VM) de StarkNet y tienen acceso al estado persistente de StarkNet. Pueden modificar variables, comunicarse con otros contratos y operar sin problemas la L1.

*Programa:* son un tipo de contrato sin estado, lo que significa que no tienen acceso al almacenamiento mientras se escriben y no pueden interactuar con otros programas de Cairo ni con la cadena L1.

#### Ejecutar un programa

Versión de cairo-compile
```bash
cairo-compile --version
```

Ejecutar un programa Cairo(Debe tener un main)
```bash
cairo-run ./hola-cairo/fibonacci.cairo
```


#### Deploy de un contrato
Acceder al entorno virtual de python
```bash
source ~/cairo_venv_v11/bin/activate
```

Versión de starknet
```bash
starknet --version
```

Compilar el contrato
```bash
starknet-compile -- ./hola-cairo/balance.cairo ./hola-cairo/balance.json
```

Declarar el contrato
```bash
starknet declare --contract ./hola-cairo/balance.json --account version_11
```

Deploy del contrato
```bash
starknet deploy --class_hash reemplazar_class_hash --account version_11
```

Para mas información sobre el deploy de un contrato, revisar el siguiente [repositorio](https://github.com/starknet-edu/deploy-cairo1-demo)

### Scarb
[Instalación](https://docs.swmansion.com/scarb/download)

Crear un proyecto
```bash
scarb new hello_scarb
```

Si queremos que nuestro proyecto no tenga VCS, podemos usar la opción `--vcs`.
```bash
scarb new hello_scarb --vcs
```

Estructura del proyecto: como resultado de ejecutar `scarb new` obtenemos estos dos archivos.

```javascript
hello_scarb
├── Scarb.toml
└── src/lib.cairo
```

Ejemplo: `Scarb.toml`
```javascript
[package]
name = "hello_scarb"
version = "0.1.0"
 
[dependencies]
```


Construir un proyecto
```bash
scarb build
```
Scripts personalizados
Para ejecutar un script personalizado, debemos `scarb run script_name`. En este caso quedaria `scarb run test`.
```javascript
[package]
name = "hello_scarb"
version = "0.1.0"

[scripts]
test = "cairo-test ."
```

Agregar dependencias
Para actualizar las dependencias, debemos ejecutar el comando `scarb build`.
```javascript
[package]
name = "hola_scarb"
version = "0.1.0"

[dependencies]
math_scarb = { git = "https://github.com/dpinones/math_scarb.git", rev = "b68667f" }
```

Documentación de scarb https://docs.swmansion.com/scarb/

### Scarb eject 
#### cairo_project.toml
Este es el archivo de configuración para los proyectos Cairo "vainilla" (no administrados por Scarb), que se requiere para ejecutar el comando `cairo-test`. Se requiere hasta que Scarb implemente esta característica. 
Podemos generar este archivo gracias al comando `scarb eject`. Tambien lo podemos crear de forma manual.

Ejemplo: `cairo_project.toml`
```javascript
[crate_roots]
hello_scarb = "src"
```
Documentación de scarb eject https://github.com/software-mansion-labs/scarb-eject

### Protostar
* Instalación
* Crear un proyecto
* Estructura del proyecto
* Correr pruebas

### Recursos