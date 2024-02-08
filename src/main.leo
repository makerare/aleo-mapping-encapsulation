// The 'mapping_encapsulation' program.
program mapping_encapsulation.aleo {
    mapping example: u64 => u32;

    transition set_example(public key: u64, public value: u32) { // Setter
        return then finalize(key, value);
    } 
    finalize set_example(public key: u64, public value: u32) {
        example.set(key, value);
    }

    transition remove_example(public key: u64) {
        return then finalize(key);
    } 
    finalize remove_example(public key: u64) {
        example.remove(key);
    }

    transition assert_example(public key: u64, public value: u32) { // Asserter (Getter equivalent)
        return then finalize(key, value);
    } 
    finalize assert_example(public key: u64, public value: u32) {
        let stored_value: u32 = example.get(key);
        assert_eq(value, stored_value);
    }

    transition assert_with_default_example(
        public key: u64, public value: u32, default_value: u32
    ) { 
        return then finalize(key, value, default_value);
    }
    finalize assert_with_default_example(
        public key: u64, public value: u32, default_value: u32
    ) {
        let stored_value: u32 = example.get_or_use(key, default_value);
        assert_eq(value, stored_value);
    }

    transition assert_exists_example(public key: u64, public exists: bool) { 
        return then finalize(key, exists);
    } 
    finalize assert_exists_example(public key: u64, public exists: bool) {
        let stored_exists: bool = example.contains(key);
        assert_eq(stored_exists, exists);
    }
}
