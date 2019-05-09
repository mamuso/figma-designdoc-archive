#!/usr/bin/env bash
set -e

jekyll serve

exec "$@"
