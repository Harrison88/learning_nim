import tables, pyobj

type
  Frame* = ref object
    code*: string
    globals*: PyMap
    locals*: PyMap
    parent*: Frame
    stack*: PyStack
    builtins*: PyMap
    isEmpty*: bool


proc newFrame*(code: string, globals = newPyMap(), locals = newPyMap(), parent = Frame(isEmpty: true)): Frame =
  result = Frame(code: code, globals: globals, locals: locals, parent: parent)

proc `$`*(frame: Frame): string =
  if frame == nil:
    return "nil"
  if frame.isEmpty:
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
