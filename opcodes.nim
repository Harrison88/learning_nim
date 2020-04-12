type
  Opcodes* = enum
    pop_top = 1,
    rot_two,
    rot_three,
    dup_top,
    dup_top_two,
    rot_four,
    
    nop = 9,
    unary_positive,
    unary_negative,
    unary_not,
    
    unary_invert = 15,
    
    binary_matrix_multiply,
    inplace_matrix_multiply,
    
    binary_power = 19,
    binary_multiply,
    
    binary_modulo = 22,
    binary_add,
    binary_subtract,
    BINARY_SUBSCR,
    BINARY_FLOOR_DIVIDE,
    BINARY_TRUE_DIVIDE,
    INPLACE_FLOOR_DIVIDE,
    INPLACE_TRUE_DIVIDE,

    GET_AITER = 50,
    GET_ANEXT,
    BEFORE_ASYNC_WITH,
    BEGIN_FINALLY,
    END_ASYNC_FOR,
    INPLACE_ADD,
    INPLACE_SUBTRACT,
    INPLACE_MULTIPLY,

    INPLACE_MODULO = 59,
    STORE_SUBSCR,
    DELETE_SUBSCR,
    BINARY_LSHIFT,
    BINARY_RSHIFT,
    BINARY_AND,
    BINARY_XOR,
    BINARY_OR,
    INPLACE_POWER,
    GET_ITER,
    GET_YIELD_FROM_ITER,

    PRINT_EXPR,
    LOAD_BUILD_CLASS,
    YIELD_FROM,
    GET_AWAITABLE,

    INPLACE_LSHIFT = 75,
    INPLACE_RSHIFT,
    INPLACE_AND,
    INPLACE_XOR,
    INPLACE_OR,
    WITH_CLEANUP_START = 81,
    WITH_CLEANUP_FINISH,
    RETURN_VALUE,
    IMPORT_STAR,
    SETUP_ANNOTATIONS,
    YIELD_VALUE,
    POP_BLOCK,
    END_FINALLY,
    POP_EXCEPT,

    # Opcodes from here have an argument:

    STORE_NAME,       # Index in name list
    DELETE_NAME,      # ""
    UNPACK_SEQUENCE,  # Number of tuple items
    FOR_ITER,         # jrel
    UNPACK_EX,
    STORE_ATTR,       # Index in name list
    DELETE_ATTR,      # ""
    STORE_GLOBAL,     # ""
    DELETE_GLOBAL,    # ""
    LOAD_CONST = 100,       # Index in const list
    LOAD_NAME,        # Index in name list
    BUILD_TUPLE,      # Number of tuple items
    BUILD_LIST,       # Number of list items
    BUILD_SET,           # Number of set items
    BUILD_MAP,           # Number of dict entries
    LOAD_ATTR,           # Index in name list
    COMPARE_OP,          # Comparison operator
    IMPORT_NAME,         # Index in name list
    IMPORT_FROM,         # Index in name list

    JUMP_FORWARD,         # Number of bytes to skip #jlrel
    JUMP_IF_FALSE_OR_POP, # Target byte offset from beginning of code #jabs
    JUMP_IF_TRUE_OR_POP,  # "" #jabs
    JUMP_ABSOLUTE,        # "" #jabs
    POP_JUMP_IF_FALSE,    # "" #jabs
    POP_JUMP_IF_TRUE,     # "" #jabs

    LOAD_GLOBAL,          # Index in name list

    SETUP_FINALLY,        # Distance to target address # jrel

    LOAD_FAST = 124,      # Local variable number
    STORE_FAST,           # Local variable number
    DELETE_FAST,          # Local variable number

    RAISE_VARARGS = 130,  # Number of raise arguments (1, 2, or 3)
    CALL_FUNCTION,        # #args
    MAKE_FUNCTION,        # Flags
    BUILD_SLICE,          # Number of items
    LOAD_CLOSURE,         # hasfree
    LOAD_DEREF,           # hasfree
    STORE_DEREF,          # hasfree
    DELETE_DEREF,         # hasfree

    CALL_FUNCTION_KW = 141, # #args + #kwargs
    CALL_FUNCTION_EX,       # Flags

    SETUP_WITH,             # jrel
    EXTENDED_ARG,
    LIST_APPEND,
    SET_ADD,
    MAP_ADD,

    LOAD_CLASSDEREF,        # hasfree

    BUILD_LIST_UNPACK = 149,
    BUILD_MAP_UNPACK,
    BUILD_MAP_UNPACK_WITH_CALL,
    BUILD_TUPLE_UNPACK,
    BUILD_SET_UNPACK,

    SETUP_ASYNC_WITH,        # jrel

    FORMAT_VALUE,
    BUILD_CONST_KEY_MAP,
    BUILD_STRING,
    BUILD_TUPLE_UNPACK_WITH_CALL,

    LOAD_METHOD = 160,       # name
    CALL_METHOD,
    CALL_FINALLY,        # jrel
    POP_FINALLY

const nameArg* = [STORE_NAME, DELETE_NAME, STORE_ATTR, DELETE_ATTR, STORE_GLOBAL, DELETE_GLOBAL,
  LOAD_NAME, LOAD_ATTR, IMPORT_NAME, IMPORT_FROM, LOAD_GLOBAL, LOAD_METHOD]
  


