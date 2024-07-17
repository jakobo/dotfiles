LATEST=$(asdf latest python)

asdf install python $LATEST
asdf global python $LATEST

# poetry
curl -sSL https://install.python-poetry.org | python3 -