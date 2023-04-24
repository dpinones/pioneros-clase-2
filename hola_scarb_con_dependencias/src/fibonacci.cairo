use math_scarb::fibonacci;

fn fib(n: felt252) -> felt252 {
    fibonacci::fib(0, 1, n)
}
