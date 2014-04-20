#!/usr/bin/perl
use strict;
use warnings;

my $repo_root_dir = "/home/depappas/repos/third_party_emacs_git_repos";
my %git_repos;

&init();
&makeDirs();

sub init() {
    $git_repos{"popup-el"} = "https://github.com/auto-complete/popup-el.git";
    $git_repos{"cl-lib"} = "https://github.com/emacsmirror/cl-lib.git";
}

sub makeDirs() {
    my @dirs = keys %git_repos;

    for my $d (@dirs) {
	my $dd = "$repo_root_dir/$d";
	if (!-d $dd) {
	    print "Making dir:", $dd, "\n";
	    system("mkdir $dd");
	}
	else {
	    print "Dir exists:", $dd, "\n";
	}
    }
}
