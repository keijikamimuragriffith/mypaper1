/*
/// Module: simple_token
module simple_token::simple_token;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module simple_token::simple_token {
     use std::string::{Self, String};

    // definition of error code
    const EInsufficientBalance: u64 = 1;

    // Struct of Token object
    public struct TokenObject has key, store {
        id: object::UID,
        amount: u64,
    }

    // Function to create Token
    public fun create(ctx: &mut tx_context::TxContext): TokenObject {
        TokenObject {
            id: object::new(ctx),
            amount: 1000
        }
    }

    // Check balance of Token
    public fun balance_of(token: &TokenObject): u64 {
        token.amount
    }

    // Example - transfer 800 Token to other
    public fun transfer_part(token: &mut TokenObject, to: address, ctx: &mut tx_context::TxContext) {
        // split 800 token
        //assert!(token.amount >= 800, 0);
        assert!(token.amount >= 800, EInsufficientBalance);
        
        // Update original balance of token
        token.amount = token.amount - 800;
        
        // New object create (800 token)
        let new_token = TokenObject {
            id: object::new(ctx),
            amount: 800
        };
        
        // Transfer to other user
        transfer::public_transfer(new_token, to);
    }
 // error messages
    public fun get_error_message(error_code: u64): String {
        if (error_code == EInsufficientBalance) {
            string::utf8(b"Insufficient balance. Required amount: 800")
        } else {
            string::utf8(b"An unknown error occurred")
        }
    }