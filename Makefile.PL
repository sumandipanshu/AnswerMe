use strict;
use warnings;
use ExtUtils::MakeMaker;
use 5.26.1;

WriteMakefile(
    NAME         => 'Scraper',
    AUTHOR       => q{Dipanshu <https://github.com/sumandipanshu>},
    VERSION_FROM => 'lib/Scraper.pm',
    ABSTRACT     => 'Scraping query results from StackOverflow and Google',
    ( $ExtUtils::MakeMaker::VERSION >= 7.44 ? ( 'LICENSE' => 'perl' ) : () ),
    EXE_FILES  => [
        'script/answerme.pl'
    ],
    PREREQ_PM => {
        'WWW::Mechanize'                => 1.92,
        'JSON::XS'                      => 4.0,
        'HTML::TreeBuilder::XPath'      => 0.11,
        'HTML::FormatText::WithLinks'   => 0.15,
        'FindBin'                       => 1.51,
        'lib'                           => 0.64,
    },
    TEST_REQUIRES => {
        'Test::More' => '1.3'
    },
    META_MERGE => {
        'meta-spec' => {version =>0},
        resources => {
            repository =>{
                type => 'git',
                url => 'https://github.com/sumandipanshu/AnswerMe'
            },
            bugtracker =>{web => 'https://github.com/sumandipanshu/AnswerMe/issues'}
        }
    },
);