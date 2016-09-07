#!/bin/bash

ROOT='Q6423319'

echo -ne "number of classes:\t"
wdq -f text -c class "?class wdt:P279* wd:$ROOT"
echo -ne "level 1 subclasses:\t"
wdq -f text -c class "?class wdt:P279 wd:$ROOT"
echo -ne "number of instances:\t"
wdq -f text -c instance "?class wdt:P279* wd:$ROOT . ?instance wdt:P31 ?class"
echo "level 1 subclasses:"
wdq -gen -f '{label} {count}' -lid "SELECT ?id ?label (COUNT(DISTINCT(?in)) AS ?count) { ?id wdt:P279 wd:$ROOT . ?type wdt:P279* ?id . ?in wdt:P31 ?type } GROUP BY ?id ?label"
wdq -gen -f '{label} {count}' -lid "SELECT ?id ?label (COUNT(DISTINCT(?type)) AS ?count) { ?id wdt:P279 wd:$ROOT . ?type wdt:P279* ?id } GROUP BY ?id ?label"
