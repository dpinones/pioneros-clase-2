#[contract]
mod Balance {

    struct Storage {
        balance: felt252,
    }

    #[constructor]
    fn constructor() {
        balance::write(0);
    }

    #[view]
    fn get_balance() -> felt252 {
        balance::read()
    }

    #[external]
    fn increase_balance(amount: felt252) {
        let current_balance = balance::read();
        balance::write(current_balance + amount);
    }
}