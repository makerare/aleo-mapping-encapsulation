import mapping_encapsulation.aleo;
program call_encapsulated_mapping.aleo;



function call_set_example:
    input r0 as u64.public;
    input r1 as u32.public;
    call mapping_encapsulation.aleo/set_example r0 r1 into r2;
    async call_set_example r2 into r3;
    output r3 as call_encapsulated_mapping.aleo/call_set_example.future;

finalize call_set_example:
    input r0 as mapping_encapsulation.aleo/set_example.future;
    await r0;


function call_remove_example:
    input r0 as u64.public;
    call mapping_encapsulation.aleo/remove_example r0 into r1;
    async call_remove_example r1 into r2;
    output r2 as call_encapsulated_mapping.aleo/call_remove_example.future;

finalize call_remove_example:
    input r0 as mapping_encapsulation.aleo/remove_example.future;
    await r0;


function call_assert_example:
    input r0 as u64.public;
    input r1 as u32.public;
    call mapping_encapsulation.aleo/assert_example r0 r1 into r2;
    async call_assert_example r2 into r3;
    output r3 as call_encapsulated_mapping.aleo/call_assert_example.future;

finalize call_assert_example:
    input r0 as mapping_encapsulation.aleo/assert_example.future;
    await r0;


function call_assert_wth_default_example:
    input r0 as u64.public;
    input r1 as u32.public;
    input r2 as u32.private;
    call mapping_encapsulation.aleo/assert_with_default_example r0 r1 r2 into r3;
    async call_assert_wth_default_example r3 into r4;
    output r4 as call_encapsulated_mapping.aleo/call_assert_wth_default_example.future;

finalize call_assert_wth_default_example:
    input r0 as mapping_encapsulation.aleo/assert_with_default_example.future;
    await r0;


function call_assert_exists_example:
    input r0 as u64.public;
    input r1 as boolean.public;
    call mapping_encapsulation.aleo/assert_exists_example r0 r1 into r2;
    async call_assert_exists_example r2 into r3;
    output r3 as call_encapsulated_mapping.aleo/call_assert_exists_example.future;

finalize call_assert_exists_example:
    input r0 as mapping_encapsulation.aleo/assert_exists_example.future;
    await r0;
