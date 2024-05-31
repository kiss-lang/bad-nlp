#! /bin/bash

source util.sh

if [ -z "$1" ]; then
    echo "Examples:"
    echo "$0 crawl [crawled] [crawls]"
    echo "$0 run ran [runs]"
    exit 1
fi

first_letter() {
    echo ${1:0:1}
}

first_two_letters() {
    echo ${1:0:2}
}

add() {
    fl=$(first_letter "$1")
    ftl=$(first_two_letters "$1")

    folder="motion-verb-database/${fl}"
    if [ ! -d "$folder" ]; then
        mkdir "$folder"
    fi

    echo "${1}" >> "${folder}/${ftl}.txt"
}

first_person="$1"
past_tense="$2"
confirm="y"
if [ -z "$past_tense" ]; then
    past_tense="${1}ed"
    confirm=""
fi
present_tense="$3"
if [ -z "$present_tense" ]; then
    present_tense="${1}s"
    confirm=""
fi
if [ -z "$confirm" ]; then
    prompt_char "I ${first_person}. They ${past_tense}. He/she ${present_tense}. confirm y/n?"
    confirm=$REPLY
fi
if [ "$confirm" = "y" ]; then
    add "${first_person}"
    add "$past_tense"
    add "$present_tense"
else
    echo "Nothing added"
fi