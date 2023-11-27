program mapping_encapsulation.aleo;



mapping example:
	key as u64.public;
	value as u32.public;

function set_example:
    input r0 as u64.public;
    input r1 as u32.public;
    async set_example r0 r1 into r2;
    output r2 as mapping_encapsulation.aleo/set_example.future;

finalize set_example:
    input r0 as u64.public;
    input r1 as u32.public;
    set r1 into example[r0];


function remove_example:
    input r0 as u64.public;
    async remove_example r0 into r1;
    output r1 as mapping_encapsulation.aleo/remove_example.future;

finalize remove_example:
    input r0 as u64.public;
    remove example[r0];


function assert_example:
    input r0 as u64.public;
    input r1 as u32.public;
    async assert_example r0 r1 into r2;
    output r2 as mapping_encapsulation.aleo/assert_example.future;

finalize assert_example:
    input r0 as u64.public;
    input r1 as u32.public;
    get example[r0] into r2;
    assert.eq r1 r2;


function assert_with_default_example:
    input r0 as u64.public;
    input r1 as u32.public;
    input r2 as u32.private;
    async assert_with_default_example r0 r1 r2 into r3;
    output r3 as mapping_encapsulation.aleo/assert_with_default_example.future;

finalize assert_with_default_example:
    input r0 as u64.public;
    input r1 as u32.public;
    input r2 as u32.public;
    get.or_use example[r0] r2 into r3;
    assert.eq r1 r3;


function assert_exists_example:
    input r0 as u64.public;
    input r1 as boolean.public;
    async assert_exists_example r0 r1 into r2;
    output r2 as mapping_encapsulation.aleo/assert_exists_example.future;

finalize assert_exists_example:
    input r0 as u64.public;
    input r1 as boolean.public;
    contains example[r0] into r2;
    assert.eq r2 r1;
