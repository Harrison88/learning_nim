import tables, pyobj

type
  Frame* = ref object
    code*: string
    globals*: Table[string, PyObjRef]
    locals*: Table[string, PyObjRef]
    parent*: Frame


proc `$`*(frame: Frame): string =
  if frame == nil:
    return "nil"
  result = "Frame(\""
  result.add($frame.code)
  result.add("\", ")
  result.add($frame.globals)
  result.add(", ")
  result.add($frame.locals)
  result.add(", ")
  result.add($frame.parent)
  result.add(")")
