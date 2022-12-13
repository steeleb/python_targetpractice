# To run this script, enter 'bash venv_setup.bash' in your terminal

#set up venv
brew install python@3.8 #M1 macs need to load 3.8 (not the latest release) otherwise some packages won't load.
python3 -m venv env
source env/bin/activate
python3 -m pip install jupyter pandas numpy matplotlib earthengine-api
python3 -m pip freeze > requirements.txt
#NOTE: make sure you include */env/ in your .gitignore, otherwise it's obnoxious in commit history.
