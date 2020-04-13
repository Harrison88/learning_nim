import tables

type
  PyObjTypes = enum
    pyInt, pyStr

  PyObjRef* = ref PyObj
  PyObj* = object
    case kind*: PyObjTypes
    of pyInt:
      num*: int
    of pyStr:
      str*: string
  
  PyStack* = seq[PyObjRef]
  PyMap* = TableRef[string, PyObjRef]
  

proc createPyObj*(value: int): PyObjRef =
  result = PyObjRef(kind: pyInt, num: value)

proc createPyObj*(value: string): PyObjRef =
  result = PyObjRef(kind: pyStr, str: value)
  
proc `$`*(obj: PyObjRef): string =
  case obj.kind:
  of pyInt:
    result = $obj.num
  of pyStr:
    result = "\""
    result.add(obj.str)
    result.add("\"")


proc newPyMap*(): PyMap =
  result = newTable[string, PyObjRef]()
