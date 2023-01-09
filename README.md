# python_targetpractice

Just a quick try at using `targets` to check and run python scripts.
Here, we run a couple of quick .py scripts to test functionality within `targets`. This is
in part a quick sanity check to see how to integrate python scripts into
a `targets` workflow, since `targets` does not explicitly work with .py scripts.

NOTE: This example
uses the Earth Engine API as a test case for python interoperability within targets. 
Earth Engine API requires an Earth Engine account.

------------------------------------------------------------------------

## Prep to use Python and EE

After you've forked this repo, you'll have to set up a Python virtual
environment. This is done using the `reticulate` package in the script
`pySetup.Rmd`. Follow along in that script to install a version of
Python, create a Python virtual environment, and install the necessary
modules to run the scripts in this R Project.

Now you'll need to download and configure `gcloud` if you have not done
so already. Follow the instructions
[here](https://cloud.google.com/sdk/docs/install#installation_instructions).
**Restart your computer** before you try to move on to authenticating
and testing the python/GEE scripts.

After you've done these once, you shouldn't have to again.

------------------------------------------------------------------------

## Authenticating and Testing GEE/Python scripts in the terminal:

In order to use the GEE python API, we need to authenticate our google
access to GEE. This require a manual validation of your account. If you
haven't already, you'll need to sign up for GEE access using a gmail address.

Using the .zsh terminal in R Studio, we'll now test to make sure our
scripts are working. First, confirm that you are using a .zsh (not a
bash) terminal by clicking on the down arrow to the right of 'Terminal
1' , select 'Terminal Options', and in the pop up make sure that 'New
Terminals Open With' is set to .zsh. Now, close the terminal (also with
the down arrow to the right of 'Terminal 1', and open a new terminal.
You will be in a zsh terminal now and the snips of code below should
work in that terminal.

`> python a_authenticate.py`

This should open your browser for you to select the account to use in
GEE.

Now we can run the b_loadlocs.py script. This uses the GEE python API.

`> python b_loadlocs.py`

Your terminal output should look like an unformatted .eml file (lots of
squiggle brackets and parentheses and colons!)

Now we can run the c_plot.py script. This script does not use the GEE
python API, but it does use other modules in your environment.

`> python c_plot.py`

The matplotlib engine should open on your machine and show you a very
simple x-y scatterplot. The program will hang until you close that
window.

------------------------------------------------------------------------

## Simple targets workflow

It seems like the two easiest ways to run .py scripts are to:

(a) load 'reticulate' in the \_targets.R file, make the file.py a target
    file, and use source_python(file.py)
(b) don't load 'reticulate' in \_targets.R, rather make a simple
    function wrapper that uses the source_python()

In the `_targets.R` script, is an example of both of these methods. NOTE: tar_make() will hang until you close the matplotlib window in this particular workflow. 
