<p align="center">
    <img src="https://i.imgur.com/G7RSyCh.jpg" width="490" height="300" alt"answerme">
    <br>
    <img src="https://img.shields.io/github/languages/top/sumandipanshu/AnswerMe?style=for-the-badge&logo=appveyor"
        alt="Perl">
    <img src="https://img.shields.io/github/stars/sumandipanshu/AnswerMe?style=for-the-badge" alt="Stars">
    <img src="https://img.shields.io/github/issues/sumandipanshu/AnswerMe?style=for-the-badge" alt="Issues">
    <img src="https://img.shields.io/github/forks/sumandipanshu/AnswerMe?style=for-the-badge" alt="Forks">
</p>
<p align="center">
    <a href="#installation">Installation</a> •
    <a href="#Usage">Usage</a> •
    <a href="#features">Key Features</a> •
    <a href="#to-do">To-Do</a> 
</p>

---
*AnswerMe* is a script (wriiten in `perl`) which fetches you the StackOverflow answers for all of your programming/coding doubts.
It uses StackOverflow as well as Google's best search results available.

It is inspired from [HowTo](https://github.com/pr4k/howto) which is purely
written in `Go`.
</p>

---
# Installation
Clone the repo, install prerequisites (see below), then build it:

```bash
# clone this repo
$ git clone https://github.com/sumandipanshu/AnswerMe.git

# change the working directory to AnswerMe
$ cd AnswerMe

# install perl5 if not installed

$ perl Makefile.PL

# build + unit tests
$ make && make test
```
Then install it:
```bash
# this step may require writing permissions
$ sudo make install
```
**Note:** On Windows platforms, you should use `dmake` or `nmake`, instead of `make`.

If your perl is system-managed, you can create a local::lib in your home
directory to install modules to. For details, see the local::lib documentation:
https://metacpan.org/pod/local::lib

The prerequisites of this distribution will also have to be installed manually. The
prerequisites are listed in one of the files: `MYMETA.yml` or `MYMETA.json` generated
by running the manual build process described above.

# Usage
To run this script, type the following:
```bash
$ answerme.pl
```
You can find the Search Results in your working directory named as
*results.json*.

---
# Features
- Uses google's result along with stackoverflow's result.
- Provides JSON file containing results from both (can used wherever
you want).

# To-Do
- [x] Add google results along with stackoverflow results
- [ ] Create a Terminal ui for navigating through the answers
- [ ] Implement Syntax Highlighting for code parts
- [ ] Setup the AnswerMe on **Docker**

---
# License

[![License](https://img.shields.io/github/license/sumandipanshu/AnswerMe?style=for-the-badge&color=blue)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- Copyright 2020 © Dipanshu
---