#!/bin/bash
set -e

echo "====================SEARXNG2 START===================="


# clone SearXNG repo
git clone "https://github.com/searxng/searxng" \
                   "/usr/local/searxng/searxng-src"

echo "====================SEARXNG2 VENV===================="

# create virtualenv:
# create virtualenv:
/opt/pyenv/versions/3.12.4/bin/python -m venv "/usr/local/searxng/searx-pyenv"

# make it default
echo ". /usr/local/searxng/searx-pyenv/bin/activate" \
                   >>  "/usr/local/searxng/.profile"

# activate venv
source "/usr/local/searxng/searx-pyenv/bin/activate"

echo "====================SEARXNG2 INST===================="

# update pip's boilerplate
pip install --no-cache-dir -U pip setuptools wheel pyyaml lxml msgspec

# jump to SearXNG's working tree and install SearXNG into virtualenv
cd "/usr/local/searxng/searxng-src"
pip install --no-cache-dir --use-pep517 --no-build-isolation -e .

# cleanup cache
pip cache purge

echo "====================SEARXNG2 END===================="