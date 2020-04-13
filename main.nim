import json, tables, base64, opcodes, pyobj/pyobj, pyobj/frame

let contents = readFile("test.py.json")
let pyCode = parseJson(contents)

let code = pyCode["code"]

var
  stack: PyStack = @[]
  codeStr = base64.decode(code.getStr())
  frames: seq[Frame] = @[]
  currentFrame = newFrame(codeStr)


proc getConstOpArg(opIndex: int): PyObjRef =
  let opArgIndex = int(codeStr[opIndex+1])
  let opArg = pycode["consts"][opArgIndex]
  
  case opArg.kind:
  of JInt:
    result = createPyObj(opArg.getInt())
  of JString:
    result = createPyObj(opArg.getStr())
  else: discard

proc getNameOpArg(opIndex: int): string =
  result = pycode["names"][opIndex+1].getStr()
    

for opIndex, op in codeStr:
  case ord(op):
  of ord(LOAD_CONST):
    let opArg = getConstOpArg(opIndex)
    stack.add(opArg)
    
  of ord(STORE_NAME):
    var opArgIndex = ord(codeStr[opIndex+1])
    var opArg = pyCode["names"][opArgIndex]
    currentFrame.locals[opArg.getStr]= stack[^1]
  else: discard

echo currentFrame
