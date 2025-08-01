# Text-to-Object-Name

* Text-to-Object-Name (T2ON) is a set of algorithms that converts a file to the set of a certain number of words, and a word frequency counter.  It does not breason out words.

* To breason out words, one needs to finish an Education short course and read the instructions in <a href="https://github.com/luciangreen/Text-to-Object-Name/blob/main/Instructions_for_Breasoning.txt">Instructions_for_Breasoning.txt</a>.

* Generally, 80 word breasonings are needed to earn a high distinction at undergraduate level and below, have healthy children or sell products.  This increases to 2 * 15 * 80=2400 breasonings per Honours level chapter, approximately 2 * 50 * 80=8000 breasonings per Masters level assignment and approximately 2 * 4 * 50 * 80=32,000 breasonings per PhD level assignment.

* 50 As (50 * 80=4000 breasonings) are required to earn a job.

# Getting Started

Please read the following instructions on how to install the project on your computer for preparing for breasoning.

# Prerequisites

* Use a search engine to find the Homebrew (or other) Terminal install command for your platform and install it, and search for the Terminal command to install swipl using Homebrew and install it or download and install SWI-Prolog for your machine at <a href="https://www.swi-prolog.org/build/">SWI-Prolog</a>.

# Mac, Linux and Windows (with Linux commands installed): Prepare to run swipl

* In Terminal settings (Mac), make Bash the default shell:

```
/bin/bash
```

* In Terminal, edit the text file `~/.bashrc` using the text editor Nano:

```
nano ~/.bashrc
```

* Add the following to the file `~/.bashrc`:

```
export PATH="$PATH:/opt/homebrew/bin/"
```

* Check if `usr/local/bin` exists

```
ls -ld /usr/local/bin
```

* Create the directory if missing

```
sudo mkdir -p /usr/local/bin
```

* Link to swipl in Terminal

```
sudo ln -s /opt/homebrew/bin/swipl /usr/local/bin/swipl
```

# 1. Install manually

Download <a href="http://github.com/luciangreen/Text-to-Object-Name/">this repository</a>, <a href="http://github.com/luciangreen/Text-to-Breasonings/">Text to Breasonings repository</a>, the <a href="http://github.com/luciangreen/Lucian-Academy-Data/">Lucian Academy Data repository</a>, and the <a href="https://github.com/luciangreen/listprologinterpreter">List Prolog Interpreter Repository</a>.

# 2. Or Install from List Prolog Package Manager (LPPM)

* Download the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>:

```
mkdir GitHub
cd GitHub/
git clone https://github.com/luciangreen/List-Prolog-Package-Manager.git
cd List-Prolog-Package-Manager
swipl
['lppm'].
lppm_install("luciangreen","Text-to-Object-Name").
../
halt.
```

# Running

* In Shell:
`cd Text-to-Object-Name`
`swipl`

* Enter:
`['text_to_object_name.pl'].`

* In the SWI-Prolog environment, enter:
`t2on(N,File,String,M).`
where N is the number of times to output the file, File is the file name, String is the string to output and M is the number of words in the file to output, e.g.:
* `t2on(u,"file.txt",u,u).` or `t2on(u,u,u,u).`
Outputs file.txt.
* `t2on(2,"file.txt",u,u).`
Outputs file.txt twice.
* `t2on(u,u,"Hello world.",u).`
Breason out "Hello world.".
* `t2on(3,u,"a b c",2).`
Outputs the first two words in "a b c" ("a" and "b") 3 times.

# Reading Algorithm

* The algorithm often runs too quickly.  To notice a number of words ("read them") in unread texts, where Master=6 algorithms, PhD=~16 algorithms and professor/politician=~50 algorithms, run with:
```
`['text_to_object_name.pl'].`
W is 50*4,t2on(u,u,u,u,W).
% where W is the number of words to read
% 50 is the number of algorithms,
% and there are approximately 4 words per algorithm.
```

# Authors

Lucian Green - Initial programmer - <a href="https://www.lucianacademy.com/">Lucian Academy</a>

# License

I licensed this project under the BSD3 License - see the LICENSE.md file for details
