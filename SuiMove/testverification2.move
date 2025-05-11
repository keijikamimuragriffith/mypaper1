/*
/// Module: testverification2
module testverification2::testverification2;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module testverification2::testverification2 {
    // Return true if and only if the element `e` is in the list `xs`.
    #[allow(unused_function)]
    fun contains<E: copy + drop>(xs: &vector<E>, e: &E): bool {
        let mut i = 0;

        while (i < vector::length(xs)) {
            if (vector::borrow(xs, i) == e) {
                return true
            };

            i = i + 1;
        };

        // If we are here, we have not found the element.
        false
    }
}
