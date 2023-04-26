#[contract]
mod Balance {
    use starknet::get_caller_address;
    use starknet::ContractAddress;

    struct Storage {
        balance: LegacyMap<ContractAddress, felt252>,
    }

    #[view]
    fn get_balance(address: ContractAddress) -> felt252 {
        balance::read(address)
    }

    #[external]
    fn increase_balance(amount: felt252) {
        let caller_address = get_caller_address();
        let current_balance = balance::read(caller_address);
        balance::write(caller_address, current_balance + amount);
    }
}