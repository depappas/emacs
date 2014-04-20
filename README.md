What will do is bootstrap the package.el file for Linux Mint Emacs version 23.24.<br>
See the following for the package info<br>
http://batsov.com/articles/2012/02/19/package-management-in-emacs-the-good-the-bad-and-the-ugly/<br>

Create the directories for your emacs git clone repos and then clone/pull the git repos.<br>
After the directories are created rerun the script to pull the latest updates from github.<br>
<br>
1. git clone this repo into the following directory<br>
$HOME/repos/emacs
2. cd to the cloned repo: $HOME/repos/<br>
3. Add the emacs github repos and theme repos to the hashmaps in emacs_setup.pl<br>
4. ./emacs_setup.pl<br>
5. Add the loadpath statements to your.emacs<br>
6. Add the require statements to your .emacs and include files<br>
7. The resulting directory structure will look like:<br>
<br>
$HOME/.emacs<br>
-your .emacs file with the require statements referencing the themes and packages<br>
<br>
$HOME/.emacs.d<br>
$HOME/.emacs.d/mykeymappings.el<br>
-any of your custom files such as key mappings<br>
<br>
$HOME/.emacs/themes<br>
$HOME/.emacs/themes<br>/<git_repo_pkg_name>/*el files<br>
$HOME/.emacs/themes/zenburn-emacs<br>
-your theme files such as $HOME/repos/third_party_emacs_git_repos<br>
<br>
$HOME/repos/third_party_emacs_git_repos/<git_repo_pkg_name>/*el files<br>
$HOME/repos/third_party_emacs_git_repos/cl-lib<br>

     



