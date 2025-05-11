/*
/// Module: safe_transfer
module safe_transfer::safe_transfer;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module safe_transfer::safe_transfer {
    use sui::coin::Coin;

    public entry fun send_coin(recipient: address, coin: Coin<u64>, _ctx: &mut TxContext) {
        // sensing a coin (like external call)
        transfer::public_transfer(coin, recipient);
        // No state update is necessary: the Coin resource is consumed, making double spending impossible.
    }
}
