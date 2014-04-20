#!/usr/bin/perl
use strict;
use warnings;
use Cwd;

my $repo_root_dir = "$ENV{HOME}/repos";
&mkdir("$repo_root_dir");

my $repo_third_party_dir = "$repo_root_dir/third_party_emacs_git_repos";
&mkdir("$repo_third_party_dir");

my %git_repos;
&initGitRepoHash();
&makeGitClones($repo_third_party_dir, %git_repos);

my $emacs_d_dir = "$ENV{HOME}/.emacs.d/themes";

my %git_theme_repos;
&initThemesGitRepoHash();
&makeGitClones($emacs_d_dir, %git_theme_repos);

sub initGitRepoHash() {
    $git_repos{"popup-el"} = "https://github.com/auto-complete/popup-el.git";
    $git_repos{"cl-lib"} = "https://github.com/emacsmirror/cl-lib.git";
    $git_repos{"emacs-epc"} = "https://github.com/kiwanami/emacs-epc.git";
    $git_repos{"emacs-jedi"} = "https://github.com/tkf/emacs-jedi.git"; 
#    $git_repos{""} = ""; 
}

sub initThemesGitRepoHash() {
    $git_theme_repos{"zenburn-emacs"} = "https://github.com/bbatsov/zenburn-emacs.git"; 
#    $git_repos{""} = ""; 
}

sub makeGitClones() {
    my ($rootDirectoryPath, %repos) = @_;
    my @dirs = keys %repos;

    &mkdir("$rootDirectoryPath");

    print "Dirs:@dirs\n";

    for my $pkgName (@dirs) {
	my $gitUrl = $repos{$pkgName}; 
	&gitClone($rootDirectoryPath, $pkgName, $gitUrl)
    }
}

##################################################
# make a directory and clone the git repo into it
# if the reop exists then update it with a git pull
##################################################

sub gitClone {
    (my $rootDirectoryPath, my $dirName, my $gitUrl)  = @_;
    chdir($rootDirectoryPath) or die "$!";

    my $directoryPath = "$rootDirectoryPath/$dirName";

    print "Git clone or pull:\tdirectoryPath=$directoryPath\t\ndirName=$dirName\t\nrootDirectoryPath=$rootDirectoryPath\t\ngitUrl = $gitUrl\n";

    if (-d "$directoryPath") {
	print "Dir exists:", $directoryPath, "\n";
	chdir($directoryPath) or die "$!";
	my $cwd = getcwd;
	print "Cwd = $cwd\n";

	my $cmd = "git pull";
	execSystemCmd($cmd);
    }
    else {
	print "Cloning: $gitUrl ", , " to:", $rootDirectoryPath, "\n";
	chdir($rootDirectoryPath) or die "$!";
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


sub mkdir() {
    my ($directoryPath) = @_;

    if (-d "$directoryPath") {
	print "Dir exists:", $directoryPath, "\n";
    }
    else {
	print "Making dir:", $directoryPath, "\n";
	execSystemCmd("mkdir $directoryPath");
    }
}
