use debug::PrintTrait;

const NUMBER: felt252 = 3;
fn main() {
    let x = 5; // Variable sin declaracion de tipo 
    x.print();

    let y: felt252 = 10; // Variable con declaracion de tipo
    y.print();

    let mut x = 3; // Variable mutable
    x.print();
    x = 5; 
    x.print();

    NUMBER.print(); // Constante
}

// Funcion
fn add(a: felt252, b: felt252) -> felt252 {
    a + b
    // return a + b;
}

// Condicional
fn bigger(a: usize, b: usize) -> usize {
    if a > b {
        a
    } else {
        b
    }
}

// Ciclo
fn pow(base: felt252, mut exp: felt252) -> felt252 {
    let mut res = 1;
    loop {
        if exp == 0 {
            break res;
        } 
        res = res * base;
        exp = exp - 1;
    }
}

// Implementacion Queue
// https://github.com/keep-starknet-strange/quaireaux/blob/main/quaireaux/data_structures/src/queue.cairo