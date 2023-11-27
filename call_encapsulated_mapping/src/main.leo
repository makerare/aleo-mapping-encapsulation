import mapping_encapsulation.leo;

program call_encapsulated_mapping.aleo {
    transition call_set_example(public key: u64, public value: u32) {
        mapping_encapsulation.leo/set_example(key, value);
    } 

    transition call_remove_example(public key: u64) {
        mapping_encapsulation.leo/remove_example(key);
    } 

    // Transaction will fail if key does not exist or mapping value is different from value
    transition call_assert_example(public key: u64, public value: u32) {
        mapping_encapsulation.leo/assert_example(key, value);
    } 

    transition call_assert_wth_default_example(
        public key: u64, public value: u32, default_value: u32
    ) {
        mapping_encapsulation.leo/assert_with_default_example(
            key, value, default_value
        );
    }

    transition call_assert_exists_example(
        public key: u64, public exists: bool
    ) {
        mapping_encapsulation.leo/assert_exists_example(key, exists);
    }
}
