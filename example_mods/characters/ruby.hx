var typeToSet:String = 'Alt Animation';
function opponentNoteHitPre(daNote:Note):Void {
  if (daNote.noteType == '0' || daNote.noteType == '' || daNote.noteType == null) {
    if (FlxG.random.bool(50) && !daNote.isSustainNote) {
      daNote.noteType = typeToSet;
      if (daNote.tail.length != 0) for (t in daNote.tail) if (t != null) t.noteType == typeToSet;
    } else if (daNote.isSustainNote && daNote.parent.noteType == typeToSet) {
      if (daNote.noteType != typeToSet) daNote.noteType = typeToSet;
      if (daNote.parent.tail.length != 0) for (t in daNote.parent.tail) if (t != null && t != daNote && t.noteType != typeToSet) t.noteType == typeToSet;
    }
  }
  return;
}