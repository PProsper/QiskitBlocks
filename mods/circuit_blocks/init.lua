-- TODO:
--  When punching NOT gate block when it has a control qubit, delete entire gate
--  Define Quantum control block that creates circuit, etc.
--  Right click places circuit_gate
--  Make left click drop gate entity
--  Utilize is_gate boolean parameter of register_circuit_block function to
--      identify circuit blocks that are circuit gates
--  Remove circuit_gate group code
--  Understand and standardize on when to use colon, or dot, as function separator
--  Find alternative to hardcoding node name strings everywhere
--  Remove hearts from creative mode

dofile(minetest.get_modpath("circuit_blocks").."/circuit_blocks.lua");
dofile(minetest.get_modpath("circuit_blocks").."/circuit_node_types.lua");

minetest.register_node("circuit_blocks:qubit_0", {
    description = "Qubit 0 block",
    tiles = {"circuit_blocks_qubit_0.png"},
    groups = {oddly_breakable_by_hand=2}
})

minetest.register_node("circuit_blocks:qubit_1", {
    description = "Qubit 1 block",
    tiles = {"circuit_blocks_qubit_1.png"},
    groups = {oddly_breakable_by_hand=2}
})


minetest.register_tool("circuit_blocks:control_tool", {
	description = "Control tool",
	inventory_image = "circuit_blocks_control_tool.png",
	wield_image = "circuit_blocks_control_tool.png",
	wield_scale = { x = 1, y = 1, z = 1 },
	range = 10,
	tool_capabilities = {},
})

minetest.register_tool("circuit_blocks:rotate_tool", {
	description = "Rotate tool",
	inventory_image = "circuit_blocks_rotate_tool.png",
	wield_image = "circuit_blocks_rotate_tool.png",
	wield_scale = { x = 1, y = 1, z = 1 },
	range = 10,
	tool_capabilities = {},
})

circuit_blocks:register_circuit_block(CircuitNodeTypes.EMPTY, false, false, 0, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.X, false, false, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.X, true, true, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.X, true, false, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.X, false, true, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.H, false, false, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.H, true, false, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.H, false, true, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.Y, false, false, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.Y, true, false, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.Y, false, true, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.Z, false, false, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.Z, true, false, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.Z, false, true, 0, true)
circuit_blocks:register_circuit_block(CircuitNodeTypes.S, false, false, 0, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.SDG, false, false, 0, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.T, false, false, 0, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.TDG, false, false, 0, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.CTRL, true, true, 0, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.CTRL, true, false, 0, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.CTRL, false, true, 0, false)
circuit_blocks:register_circuit_block(CircuitNodeTypes.TRACE, false, false, 0, false)

local ROTATION_RESOLUTION = 32
for idx = 0, ROTATION_RESOLUTION do
    circuit_blocks:register_circuit_block(CircuitNodeTypes.X, false, false, idx, true)
    circuit_blocks:register_circuit_block(CircuitNodeTypes.Y, false, false, idx, true)
    circuit_blocks:register_circuit_block(CircuitNodeTypes.Z, false, false, idx, true)
end


