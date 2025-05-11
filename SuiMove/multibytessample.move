/*
/// Module: multibytessample
module multibytessample::multibytessample;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module multibytessample::multibytessample {
    use sui::event;
    
    // definition of Japanese msg
    public struct MessageChanged has copy, drop, store {
        old_message: vector<u8>,
        new_message: vector<u8>,
    }

    // keeping the msg   
   public struct MultiByteSample has key {
        id: UID,
        message: vector<u8>,
    }

    // Initialisation
    entry fun init_msg(ctx: &mut TxContext) {
        let msg = b"こんにちは、Move！"; 
        let obj = MultiByteSample {
            id: object::new(ctx),
            message: msg,
        };
        transfer::transfer(obj, tx_context::sender(ctx));
    }

    // renew the msg
    public fun set_message(obj: &mut MultiByteSample, new_message: vector<u8>) {
        event::emit(
        MessageChanged {
            old_message: copy_vector(&obj.message),
            new_message: copy_vector(&new_message),
        }
    );
    obj.message = new_message;
    }
    
    // retrieving the msg length by bytes
    public fun get_message_bytes_length(obj: &MultiByteSample): u64 {
        vector::length(&obj.message)
    }

    // get first byte of the msg
    public fun get_first_byte(obj: &MultiByteSample): u8 {
        *vector::borrow(&obj.message, 0)
    }

    public fun copy_vector(v: &vector<u8>): vector<u8> {
        let mut res = vector::empty<u8>();
        let len = vector::length(v);
        let mut i = 0;
        while (i < len) {
            let b = *vector::borrow(v, i);
            vector::push_back(&mut res, b);
            i = i + 1;
        };
        res
    }
}
