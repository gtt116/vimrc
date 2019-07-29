if exists("b:current_syntax")
    finish
endif

syn case match
syn match apsara_fatal             ".*\[FATAL\].*"
syn match apsara_error             ".*\[ERROR\].*"
syn match apsara_warning           ".*\[WARNING\].*"
syn match apsara_info              ".*\[INFO\].*"

hi def link apsara_fatal        ErrorMsg
hi def link apsara_error        WarningMsg
hi def link apsara_warning      Label
hi def link apsara_info 	    Type

let b:current_syntax = "apsara_log"
