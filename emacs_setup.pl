#!/usr/bin/perl
use strict;
use warnings;

my $repo_root_dir = "$ENV{HOME}/repos/third_party_emacs_git_repos";
my %git_repos;

&init();
&makeDirs();

sub init() {
    $git_repos{"popup-el"} = "https://github.com/auto-complete/popup-el.git";
    $git_repos{"cl-lib"} = "https://github.com/emacsmirror/cl-lib.git";
    $git_repos{"emacs-epc"} = "https://github.com/kiwanami/emacs-epc.git";
    $git_repos{"emacs-jedi"} = "https://github.com/tkf/emacs-jedi.git"; 
    $git_repos{"zenburn-emacs"} = "https://github.com/bbatsov/zenburn-emacs.git"; 
#    $git_repos{""} = ""; 
}


sub makeDirs() {
    my @dirs = keys %git_repos;

    my $directoryPath = "$repo_root_dir";
    if (-d "$directoryPath") {
	print "Dir exists:", $directoryPath, "\n";
    }
    else {
	print "Making dir:", $directoryPath, "\n";
	execSystemCmd("mkdir $directoryPath");
    }

    for my $pkgName (@dirs) {
	my $gitUrl = $git_repos{$pkgName}; 
	&gitClone($directoryPath, $pkgName, $gitUrl)
    }
}

##################################################
# make a directory and clone the git repo into it
# if the reop exists then update it with a git pull
##################################################

sub gitClone {
    (my $directoryPath, my $dirName, my $gitUrl)  = @_;
    chdir($directoryPath) or die "$!";

    if (-d "$directoryPath") {
	print "Dir exists:", $directoryPath, "\n";
	chdir($dirName) or die "$!";
	my $cmd = "git pull";
	execSystemCmd($cmd);
    }
    else {
	my $cmd = "git clone $gitUrl";
	execSystemCmd($cmd);
    }
}

sub execSystemCmd {
    (my $cmd)  = @_;

    print "cmd = $cmd\n";
    system($cmd);
    if ( $? == -1 ) {
	print "command failed: $!\n";
    }
    else {
	printf "command exited with value %d\n", $? >> 8;
    }
}
