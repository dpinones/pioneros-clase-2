use hola_scarb_con_dependencias::fibonacci;

#[test]
#[available_gas(200000)]
fn happy_path() {
    assert(fibonacci::fib(8) == 21, 'invalid result');
    assert(fibonacci::fib(10) == 55, 'invalid result');
}