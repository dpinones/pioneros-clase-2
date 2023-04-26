use scarb_contrato::Balance;
use starknet::testing::set_caller_address;
use starknet::ContractAddress;
use starknet::contract_address_try_from_felt252;
use option::OptionTrait;

const USER_ADDRESS: felt252 = 1;

#[test]
#[available_gas(2000000)]
fn test_constructor() {
    set_caller_address(felt_to_contract_address(USER_ADDRESS));
    let balance = Balance::get_balance(felt_to_contract_address(USER_ADDRESS));
    assert(balance == 0, 'balance should be 0');
}

#[test]
#[available_gas(2000000)]
fn test_balance_happy_path() {
    set_caller_address(felt_to_contract_address(USER_ADDRESS));
    Balance::increase_balance(700);
    let balance = Balance::get_balance(felt_to_contract_address(USER_ADDRESS));
    assert(balance == 700, 'balance should be 700');
}

#[test]
#[available_gas(2000000)]
fn test_balance() {
    set_caller_address(felt_to_contract_address(USER_ADDRESS));
    Balance::increase_balance(700);
    Balance::increase_balance(500);
    let balance = Balance::get_balance(felt_to_contract_address(USER_ADDRESS));
    assert(balance == 1200, 'balance should be 1200');
}

// Utils
fn felt_to_contract_address(f: felt252) -> ContractAddress {
    contract_address_try_from_felt252(f).unwrap()
}