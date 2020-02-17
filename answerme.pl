#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use JSON::XS;
use FindBin;                     
use lib "$FindBin::RealBin/";
use Scraper;

sub googleSearch($){
    my $requestUrl = 'https://www.google.com/search?q='.$_[0].'+site+stackoverflow.com&num=10&hl=en';
    my $reqContent = Scraper::getRequest($requestUrl);
    my @links = Scraper::extractLinksFromGoogle($reqContent);

    if($#links == -1){
        warn "Google Search: No results found...\n";
        return();
    }
    my %results = Scraper::extractPostFromLinks(@links);
    return(%results);
}

sub stackOverflowSearch($){
    my $requestUrl = 'https://stackoverflow.com/search?q='.$_[0];
    my $reqContent = Scraper::getRequest($requestUrl);
    my @links = Scraper::extractLinksFromStackOverflow($reqContent);

    if($#links == -1){
        warn "StackOverflow Search: No results found...\n";
        return();
    }
    my %results = Scraper::extractPostFromLinks(@links);
    return(%results); 
}

sub writeDataToJson(%) {
    open FILE, "+>results.json" or die $!;
    binmode FILE, ':utf8';

    my %results=@_;
    my $json = JSON::XS->new->pretty(1)->encode(\%results);
    print FILE $json;
    close(FILE);
}

if (__PACKAGE__ eq "main"){

    print "Enter Your search query: ";
    my $query= <STDIN>;
    chomp $query;
    while(length($query)==0){
        print "Query not entered, Try again: ";
        $query= <STDIN>;
        chomp $query;
    }
    $query=join('+',split(' ',$query));

    my %results;
    %{$results{'google'}}=googleSearch($query);
    %{$results{'stackOverflow'}}=stackOverflowSearch($query);

    if(!%results){
        print "Searching failed: Try another query.\n";
    }else{
        writeDataToJson(%results);
    }
}
