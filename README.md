# Arithmatic_Logic_Unit
An arithmatic Logic Unit which can do 32 operation!

The provided Verilog code implements a synchronous Arithmetic Logic Unit (ALU) named `Ltalu`, designed to perform 32 distinct operations on two 8-bit inputs, `A` and `B`, based on a 5-bit `opcode`. The ALU operates on the positive edge of the clock (`clk`) and includes a reset signal (`reset`) to initialize outputs. It produces a 16-bit result (`result`) and updates three flags: `carry`, `zero`, and `overflow`. The operations are categorized into arithmetic, logical, shift/rotate, comparison, and special functions, with a default case for undefined opcodes.

- **Arithmetic Operations**: Include addition, subtraction (with carry and overflow detection), multiplication, division (with modulus), increment, decrement, negation, and absolute value computation.
- **Logical Operations**: Perform bitwise AND, OR, XOR, NOT, NAND, NOR, XNOR, and AND with NOT operations on `A` and `B`.
- **Shift & Rotate Operations**: Execute logical left/right shifts, arithmetic right shift, left/right rotations, circular shifts, and nibble swapping on `A`.
- **Comparison Operations**: Compare `A` and `B` for equality, inequality, greater than, and less than, outputting a single-bit result (1 or 0).
- **Special Operations**: Include bit set, bit clear, bit toggle, and parity check on `A`, using `B` as a bit position where applicable.
- **Default Operation**: Outputs zero for undefined opcodes.
- **Flags**: The `carry` flag is updated for addition and subtraction, `overflow` for signed arithmetic overflow, and `zero` to indicate if the result is zero, with all flags reset to initial values when `reset` is asserted.
