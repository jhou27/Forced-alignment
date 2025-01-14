form Read list
word sep ;
integer tier.ortho 2
integer tier.jp 3
integer tier.phone.cit 4
integer tier.phone.act 6
integer tier.tone.cit 5
integer tier.tone.act 7
word dir /Users/aclyu/Downloads/SCOLAR-tools/4-extract-data-files
endform

date$ = date$()

list.name$ = "file_list"
in.files.path$ = dir$ + "/*-words.TextGrid"
Create Strings as file list: list.name$, in.files.path$

selectObject: "Strings "+list.name$
no.files = Get number of strings
for file from 1 to no.files
  selectObject: "Strings "+list.name$
  tg.in$ = Get string: file
  filename$ = left$(tg.in$, index(tg.in$,".")-1)
  filename2$ = left$(tg.in$, index(tg.in$,"-")-1)

  tg.in.path$ = dir$ + "/" + tg.in$
  Read from file... 'tg.in.path$'

  out.file$ = filename2$ + ".words"
  out.path$ = dir$ + "/" + out.file$


# fileappend 'out.path$' fileID 'filename2$''newline$'
# fileappend 'out.path$' comment created on 'date$''newline$'
# fileappend 'out.path$' separator 'sep$''newline$'
# fileappend 'out.path$' nfields 6'newline$'
# fileappend 'out.path$' #'newline$'

  select TextGrid 'filename$'
  no.ints = Get number of intervals... tier.ortho
  for int from 1 to no.ints
#   for int from 854 to 854
   lab.ortho$ = Get label of interval... tier.ortho int
    t.off = Get end point... tier.ortho int
    if lab.ortho$<>""
      lab.jp$ = Get label of interval... tier.jp int

      lab.phone.cit$ = Get label of interval... tier.phone.cit int
      length.phone.seq = length(lab.phone.cit$)
      lab.phone.cit.new$ = ""
      for n from 1 to length.phone.seq
        lab.add$ = right$(left$(lab.phone.cit$,n), 1)
        if n>1
          lab.add.prev$ = right$(left$(lab.phone.cit$,n-1), 1)
        else
          lab.add.prev$ = ""
        endif
        if n<length.phone.seq
          lab.add.next$ = right$(left$(lab.phone.cit$,n+1), 1)
        else
          lab.add.next$ = ""
        endif
        if lab.add.prev$="{" or lab.add.prev$="|" or lab.add$="|" or lab.add$="}" or lab.add$="ː" or lab.add$="ʰ" or lab.add$="ʷ"
          lab.phone.cit.new$ = lab.phone.cit.new$ + lab.add$
        elsif lab.add.prev$="t" and lab.add$="s"
          lab.phone.cit.new$ = lab.phone.cit.new$ + lab.add$
        elsif lab.add.prev$="t" and lab.add$="ɕ"
          lab.phone.cit.new$ = lab.phone.cit.new$ + lab.add$
        elsif lab.add.prev$="ː" and lab.add$="i"
          lab.phone.cit.new$ = lab.phone.cit.new$ + lab.add$
        elsif lab.add.prev$="ː" and lab.add$="u"
        lab.phone.cit.new$ = lab.phone.cit.new$ + lab.add$
        elsif lab.add.prev$="ɐ" and lab.add$="i"
          lab.phone.cit.new$ = lab.phone.cit.new$ + lab.add$
        elsif lab.add.prev$="ɐ" and lab.add$="u"
          lab.phone.cit.new$ = lab.phone.cit.new$ + lab.add$
        elsif lab.add.prev$="e" and lab.add$="i"
          lab.phone.cit.new$ = lab.phone.cit.new$ + lab.add$
        elsif lab.add.prev$="ɛ" and lab.add$="u"
          lab.phone.cit.new$ = lab.phone.cit.new$ + lab.add$
        elsif lab.add.prev$="i" and lab.add$="u"
          lab.phone.cit.new$ = lab.phone.cit.new$ + lab.add$
        elsif lab.add.prev$="ɔ" and lab.add$="i"
          lab.phone.cit.new$ = lab.phone.cit.new$ + lab.add$
        elsif lab.add.prev$="o" and lab.add$="u"
          lab.phone.cit.new$ = lab.phone.cit.new$ + lab.add$
        elsif lab.add.prev$="u" and lab.add$="i"
          lab.phone.cit.new$ = lab.phone.cit.new$ + lab.add$
        elsif lab.add.prev$="ɵ" and lab.add$="y"
          lab.phone.cit.new$ = lab.phone.cit.new$ + lab.add$
        else
          lab.phone.cit.new$ = lab.phone.cit.new$ + " " + lab.add$
        endif
      endfor

      lab.phone.act$ = Get label of interval... tier.phone.act int
      length.phone.seq = length(lab.phone.act$)
      lab.phone.act.new$ = ""
      for n from 1 to length.phone.seq
        lab.add$ = right$(left$(lab.phone.act$,n), 1)
        if n>1
          lab.add.prev$ = right$(left$(lab.phone.act$,n-1), 1)
        else
          lab.add.prev$ = ""
        endif
        if n<length.phone.seq
          lab.add.next$ = right$(left$(lab.phone.act$,n+1), 1)
        else
          lab.add.next$ = ""
        endif
        if lab.add$="ː" or lab.add$="ʰ" or lab.add$="ʷ"
          lab.phone.act.new$ = lab.phone.act.new$ + lab.add$
        elsif lab.add.prev$="t" and lab.add$="s"
          lab.phone.act.new$ = lab.phone.act.new$ + lab.add$
        elsif lab.add.prev$="t" and lab.add$="ɕ"
          lab.phone.act.new$ = lab.phone.act.new$ + lab.add$
        elsif lab.add.prev$="ː" and lab.add$="i"
          lab.phone.act.new$ = lab.phone.act.new$ + lab.add$
        elsif lab.add.prev$="ː" and lab.add$="u"
          lab.phone.act.new$ = lab.phone.act.new$ + lab.add$
        elsif lab.add.prev$="ɐ" and lab.add$="i"
          lab.phone.act.new$ = lab.phone.act.new$ + lab.add$
        elsif lab.add.prev$="ɐ" and lab.add$="u"
          lab.phone.act.new$ = lab.phone.act.new$ + lab.add$
        elsif lab.add.prev$="e" and lab.add$="i"
          lab.phone.act.new$ = lab.phone.act.new$ + lab.add$
        elsif lab.add.prev$="ɪ" and lab.add$="i"
          lab.phone.act.new$ = lab.phone.act.new$ + lab.add$
        elsif lab.add.prev$="ɛ" and lab.add$="u"
          lab.phone.act.new$ = lab.phone.act.new$ + lab.add$
        elsif lab.add.prev$="i" and lab.add$="u"
          lab.phone.act.new$ = lab.phone.act.new$ + lab.add$
        elsif lab.add.prev$="ɔ" and lab.add$="i"
          lab.phone.act.new$ = lab.phone.act.new$ + lab.add$
        elsif lab.add.prev$="o" and lab.add$="u"
          lab.phone.act.new$ = lab.phone.act.new$ + lab.add$
        elsif lab.add.prev$="ʊ" and lab.add$="u"
          lab.phone.act.new$ = lab.phone.act.new$ + lab.add$
        elsif lab.add.prev$="u" and lab.add$="i"
          lab.phone.act.new$ = lab.phone.act.new$ + lab.add$
        elsif lab.add.prev$="ɵ" and lab.add$="y"
          lab.phone.act.new$ = lab.phone.act.new$ + lab.add$
        else
          lab.phone.act.new$ = lab.phone.act.new$ + " " + lab.add$
        endif
      endfor

      lab.tone.cit$ = Get label of interval... tier.tone.cit int
      lab.tone.act$ = Get label of interval... tier.tone.act int

      line$ = lab.ortho$ + sep$ + " " + lab.jp$ + sep$ + lab.phone.cit.new$ + sep$ + lab.phone.act.new$ + sep$ + " " + lab.tone.cit$ + sep$ + " " + lab.tone.act$
      fileappend 'out.path$' 't.off''tab$''line$''newline$'
    else
      fileappend 'out.path$' 't.off''tab$'<SIL>'newline$'
    endif
  endfor
endfor
