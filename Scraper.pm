package Scraper;

use strict;
use warnings;
use utf8;
use WWW::Mechanize;
use HTML::TreeBuilder::XPath;
use HTML::FormatText::WithLinks;
use FindBin;                     
use lib "$FindBin::RealBin/";


sub getRequest($) {
    my $req = WWW::Mechanize->new();
    $req->agent_alias ('Linux Mozilla');
    $req->get($_[0]);

    return($req->content);
}

sub extractLinksFromGoogle($) {
    my $searchResults = HTML::TreeBuilder::XPath->new_from_content($_[0]);
    my @links = $searchResults->findvalues('//div[@class="kCrYT"]/a[contains(@href,"stackoverflow.com/questions")]/@href');
    @links = grep (/https:\/\/stackoverflow\.com\/questions\/\d+\/.*?(?=&)/gi, @links);
    foreach my $link (@links){
        $link=~/https:\/\/stackoverflow\.com\/questions\/\d+\/.*?(?=&)/gi;
        $link=$&;
    }

    return(@links);
}

sub extractLinksFromStackOverflow($) {
    my $searchResults = HTML::TreeBuilder::XPath->new_from_content($_[0]);
    my @links = $searchResults->findvalues('//div[@class="result-link"]/h3/a/@href');
    foreach my $link (@links){
        $link="https://stackoverflow.com".$link;
    }
    
    return(@links);
}

sub extractPostFromLinks(@) {

    my %results;
    my $id=1;
    
    foreach my $link (@_){
        $results{$id}{'link'}=$link;
        
        my $questionPage=WWW::Mechanize->new();
        $questionPage->agent_alias ('Linux Mozilla');
        $questionPage->get($link);

        my $questionPagesearchResults=HTML::TreeBuilder::XPath->new_from_content($questionPage->content);

        $results{$id}{'title'}=$questionPagesearchResults->findvalue('.//div[@id="question-header"]/h1/a');

        if(index($questionPage->content,'<h2 data-answercount')!= -1){
            $results{$id}{'answerCount'}=$questionPagesearchResults->findvalue('.//h2[@data-answercount]/@data-answercount');
        }else{
            $results{$id}{'answerCount'}=0;
        }

        my $extractFrom = '<div class="post-text" itemprop="text">';
        my $extractTo = '</div>';
        my $fromIndex=0;
        my $toIndex=0;

        if ( ( $fromIndex = index($questionPage->content, $extractFrom,$toIndex)) != -1){
            if ( ( $toIndex = index($questionPage->content, $extractTo,$fromIndex)) != -1){
                my $formatter = HTML::FormatText::WithLinks->new(footnote => '');
                $results{$id}{'questionDesc'}= $formatter->parse(substr($questionPage->content, $fromIndex+length($extractFrom),$toIndex-$fromIndex-length($extractFrom)));
            }else{
            print "Error: extractTo string not found in response.\r\n";
            }
        }else{
            print "Error: extractFrom string not found in response.\r\n";
        }

        if($results{$id}->{answerCount}!=0){
            my $count=0;
            my @votes=$questionPagesearchResults->findnodes('//div[@class="js-vote-count grid--cell fc-black-500 fs-title grid fd-column ai-center"]');
            push(@{$results{'acceptedAnswersAre'}},$id);

            foreach my $voteCount (@votes){
                if($count==0){
                    $results{$id}{'questionVotes'}=$voteCount->findvalue('./text()')." vote(s)";
                }else{
                    $results{$id}{'answer'.$count}{'votes'}=$voteCount->findvalue('./text()')." vote(s)";
                    if ( ( $fromIndex = index($questionPage->content, $extractFrom,$toIndex)) != -1){
                        if ( ( $toIndex = index($questionPage->content, $extractTo,$fromIndex)) != -1){
                            my $formatter = HTML::FormatText::WithLinks->new(footnote => '');
                            $results{$id}{'answer'.$count}{'desc'}= $formatter->parse(substr($questionPage->content, $fromIndex+length($extractFrom),$toIndex-$fromIndex-length($extractFrom)));
                            
                        }else{
                            print "Error: extractTo string not found in response.\r\n";
                        }
                    }else{
                        print "Error: extractFrom string not found in response.\r\n";
                    }
                }

                $count++;
            }

        }else{
            my @votes=$questionPagesearchResults->findnodes('//div[@class="js-vote-count grid--cell fc-black-500 fs-title grid fd-column ai-center"]');
            foreach my $voteCount (@votes){
                $results{$id}{'questionVotes'}=$voteCount->findvalue('./text()')." vote(s)";
            }
        }
        
        $id=$id+1;
    }

    return(%results);
}
1;