import sys
import json
import dis
from base64 import b64encode


def handle_bytes(obj):
    if type(obj) == bytes:
        return b64encode(obj).decode("ascii")

def main(filename):
    file_obj = open(filename)
    code = compile(file_obj.read(), filename, "exec")
    dis.dis(code)
    j = {"argcount": code.co_argcount,
         "cellvars": code.co_cellvars,
         "code": code.co_code,
         "consts": code.co_consts,
         "filename": code.co_filename,
         "firstlineno": code.co_firstlineno,
         "flags": code.co_flags,
         "freevars": code.co_freevars,
         "kwonlyargcount": code.co_kwonlyargcount,
         "lnotab": code.co_lnotab,
         "name": code.co_name,
         "names": code.co_names,
         "nlocals": code.co_nlocals,
         "stacksize": code.co_stacksize,
         "varnames": code.co_varnames
     }
    output = filename + ".json"
    out = open(output, "w")
    json.dump(j, out, default=handle_bytes)
    out.close()

    
if __name__ == "__main__":
    main(sys.argv[1])
