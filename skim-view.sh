#!/bin/bash
# modified from the version available at http://sourceforge.net/p/skim-app/wiki/TeX_and_PDF_Synchronization/
# so it just does the viewing part, and also returns focus to the previous window after reloading Skim.

# the first argument should be the tex file, either with or without extension
file="$1"
[ "${file:0:1}" == "/" ] || file="${PWD}/${file}"
pdffile="${file%.tex}.pdf"

/usr/bin/osascript << EOF
    # get the current frontmost window
    tell application "System Events"
        set frontmostApplicationName to name of 1st process whose frontmost is true
    end tell
    # reload the PDF file in Skim
    set theFile to POSIX file "${pdffile}" as alias
        tell application "Skim"
        activate
        set theDocs to get documents whose path is (get POSIX path of theFile)
        if (count of theDocs) > 0 then revert theDocs
        open theFile 
    end tell
    # Reactivate frontmost window
    tell application frontmostApplicationName
        activate
    end tell
EOF