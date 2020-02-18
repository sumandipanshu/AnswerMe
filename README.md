<p align="center">
    <img src="https://i.imgur.com/G7RSyCh.jpg" height="300" alt"answerme">
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
*AnswerMe* is a script (wriiten in `perl`) for getting stackoverflow
Answers for those who are constantly googling for doing basic
programming tasks.
Now it uses both google as well as Stackoverflow to get the results,
because lets agree, google's search algorithm is way better than
stackoverflow's search algorithm.

It is inspired by [HowTo](https://github.com/pr4k/howto) which is purely
written in Go.
</p>

---
# Installation
To install this script, type the following:
```bash
# clone this repo
$ git clone https://github.com/sumandipanshu/AnswerMe.git

# change the working directory to AnswerMe
$ cd AnswerMe

# install perl5 if not installed

$ perl Makefile.PL
$ make

# to check if package was build successfully
$ make test

# this step may require writing permissions
$ sudo make install
```

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