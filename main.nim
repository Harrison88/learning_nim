import json, tables, base64, opcodes, pyobj/pyobj, pyobj/frame

let contents = readFile("test.py.json")
let pyCode = parseJson(contents)

let code = pyCode["code"]

for chr in code.getStr():
  echo ord(chr)
  
echo ord(pop_top)

echo pyCode

echo STORE_NAME in nameArg

echo ord(LOAD_CONST)

var
  stack: PyStack = @[]
  codeStr = base64.decode(code.getStr())
  frames: seq[Frame] = @[]
  currentFrame = Frame(code: codeStr)

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

echo stack

echo "Hello, world!"

var names = initTable[string, PyObjRef]()

echo names

var pyFrame = Frame(code: " ", globals: names, locals: names, parent: nil)

echo pyFrame

var nextPyFrame = Frame(code: "new", parent: pyFrame)

echo nextPyFrame
echo currentFrame
