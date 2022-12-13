# python_targetpractice

Two .py file examples here. There are some prep steps to run this on your local machine. I'm purposefully using command line as this is the most simple version of these scripts, and if we can't make targets work on these, we're going to have to do some hacks.

I'm running all of these scripts in VCode. You can use other programs or any shell, but I can't guarantee you won't have to troubleshoot.

In VCode, I'm opening the folder called 'python_targetpractice' and then following the workflow below.

Documented in '0_gcloudinstall.md':
1) install homebrew 
2) install python
3) install gcloud
Documented in '1_venv_setup.bash':
4) set up the virtual environment

After you've done these once, you won't have to again. Make sure you close whatever terminal you're using before moving on. 

---

In order to use the GEE python API, we need to authenticate our google access to GEE. This require a manual validation of your account. If you haven't already, you'll need to sign up for GEE access using your CSU-gmail address.
> python3 a_authenticate.py
This should open your browser for you to select the account to use in GEE. 

Now we can run the b_loadlocs.py script. This uses the GEE python API.
> python3 b_loadlocs.py
Your terminal output should look like an unformatted .eml file

Now we can run the c_plot.py script. This script does not use the GEE python API, but it does use other modules in your environment. 
> python3 c_plot.py
The matplotlib engine should open on your machine and show you a very simple x-y scatterplot. 
