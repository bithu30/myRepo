


### Workshop outline

###### Introduction to Pandas and Celery
(approx.) 30 mins  
###### implementations (You can do pair programming if you want)
(approx.) 1h 30 mins
###### Wrap up
(approx.) 30 mins:  


#### About Workshop
This workshop is for everyone that has a little knowledge about Python. If you are interested in data processing, visualization,
creating intelligence applications, this workshop is exactly prepared for you.

In this workshop you are going to clean data, visualize, expertise. Also you are going to make basic sentiment analysis even run a 
small neural network to analyze reviews.

Also you are start to recommend video games with a simple but valid algorithms.

At last you are going to run some Celery tasks and combine the usage of Celery to Pandas.
 

### Before the session:

#### Install Python / Make sure Python versions match 
You need python installed in your laptop. Code is tested in Python 2.7.x, 3.5.x and 3.6.x versions. Choose whichever you want 
If you use Windows or you have'nt use virtualenv, I suggest you to install Anaconda/Conda.

#### Get the code 
If you are familiar with git

``
git clone https://github.com/cenkbircanoglu/pycon-2017-ie.git
cd pycon-2017-ie
``

If not familiar

``
Download https://github.com/cenkbircanoglu/pycon-2017-ie/archive/master.zip
unzip the file
cd pycon-2017-ie
``


#### Install requirements
After installing Pyhton please install requirements.
If using Anaconda/Conda environment run 

``
sh requirements_conda.sh
``

If you are going to use virtualenv or install libraries run 

``
sh requirements_pip.sh
``

In this workshop, we generally use jupyter notebooks.
To start notebook run this on the folder where code exists. 

``
jupyter notebook
``

For celery, you need to install one broker and rabbitmq is the one choose

In ubuntu, you can install with

``
sudo apt-get install rabbitmq-server
``

In mac osx 

``
brew install rabbitmq
``

#### Downloading dataset

You are going to work with Amazon Review Dataset that I change a little bit.
Because of that please use my script to download dataset.

``
sh download_data.sh
``


If all steps are successfull, you are ready to workshop, otherwise please send me an email for help. 
cenk.bircanoglu@gmail.com



 
