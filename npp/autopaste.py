import time

from Npp import editor, notepad

bufferTemp = notepad.createScintilla()
def getOnClipboard():
    bufferTemp.setText("")
    bufferTemp.paste()
    result = bufferTemp.getText()
    return result

bufferToPaste = notepad.getCurrentBufferID()
lastOnClipboard = getOnClipboard()

try:
    while True:
        actualOnClipboard = getOnClipboard()
        if actualOnClipboard != lastOnClipboard:
            actualBuffer = notepad.getCurrentBufferID()
            notepad.activateBufferID(bufferToPaste)
            editor.appendText(actualOnClipboard + "\n")
            lastOnClipboard = actualOnClipboard
            notepad.activateBufferID(actualBuffer)
        time.sleep(0.5)
except KeyboardInterrupt:
    notepad.destroyScintilla(bufferTemp)
