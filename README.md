# python_targetpractice

Two .py file examples here. There are some prep steps to run this on your local machine. I'm purposefully using command line as this is the most simple version of these scripts.

---
## Prep to use Python and EE

I'm running all of the following scripts in VCode. You can use other programs or any shell, but I can't guarantee you won't have to troubleshoot.

In VCode, I open the folder 'target practice' and run the following from that directory.

Documented in '0_gcloudinstall.md':
1) install homebrew 
2) install python
3) install gcloud
Documented in '1_venv_setup.bash':
4) set up the virtual environment

After you've done these once, you won't have to again. Make sure you close whatever terminal you're using before moving on. If R doesn't like your virtual environment at any point, just delete the folder 'env' and run the 1_venv_setup.bash script again.

---

Authenticating and Testing GEE/Python scripts in VCode:

In order to use the GEE python API, we need to authenticate our google access to GEE. This require a manual validation of your account. If you haven't already, you'll need to sign up for GEE access using your CSU-gmail address.
> python3 a_authenticate.py
This should open your browser for you to select the account to use in GEE. 

Now we can run the b_loadlocs.py script. This uses the GEE python API.
> python3 b_loadlocs.py
Your terminal output should look like an unformatted .eml file

Now we can run the c_plot.py script. This script does not use the GEE python API, but it does use other modules in your environment. 
> python3 c_plot.py
The matplotlib engine should open on your machine and show you a very simple x-y scatterplot. 

---

Simple <targets> workflow
