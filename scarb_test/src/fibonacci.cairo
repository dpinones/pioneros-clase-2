use scarb_test::utils;

fn fib(n: felt252) -> felt252 {
    fib_internal(0, 1, n)
}

fn fib_internal(a: felt252, b: felt252, n: felt252) -> felt252 {
    utils::check_gas();
    match n {
        0 => a,
        _ => fib_internal(b, a + b, n - 1),
    }
}
