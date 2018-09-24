l
ll
..
cd Data/scott_brainard/
l
zip -r cal2018.zip cal2018/
ll
me2you cal2018.zip ~/Downloads
ll
rm cal2018.zip 
ll
..
ll
ls *
cd Printing/
ll
cd Tests/
ll
..
ll
..
mv Printing/ CAD
ll
mv CAD cadd
mv cadd cad
ll
dropbox statys
dropbox status
ll
mv ashley/ ashley_henry
ll
cd quantdracala/
l
cd 180328_SampleRun/
l
cd ../..
l
ll
mv quantdracala/ jin_yang
ll
cd hypoquantyl/
l
ls *
..
l
ll
mv semanticSegmentation/ semantic_segmentation
ll
cd semantic_segmentation/
l
cd segnet/
l
mv Demo/ demos
cd demos/
l
..
ll
..
l
ll
ls *
cd ashley_henry/rootkinematics/
l
cd Col-0_1/
l
lsl
ll
l
la
ls
feh image_2018-05-30-151437-0001.tif 
ll
l
..
l
..
l
..
l
mv irods-icommands-4.1.11-ubuntu14-x86_64.deb ~/Downloads/
D
sudo dpkg -i irods-icommands-4.1.11-ubuntu14-x86_64.deb 
l
ll
rm irods-icommands-4.1.11-ubuntu14-x86_64.deb 
cd matlab2018b/
l
..
ll
RM matlab2018b/
ll
okular OSG_Calling_Card_110515.pdf 
exit
sshx
man ssh
ssh -CX jbustamante@128.104.98.13 -p 50013
exit
sshx
ll
..
ll
cd HypoQuantyl/Helpers/
ll
cd pca/
ll
cd multiPCA/
l
..
l
..
l
..
ll
cd TestProgram/
l
.
ll
exit
triplethreat.sh 
pcupdate 
dok
cd phytoshell/
ll
mkdir 180920
mv 180920/ ..
mv * ../180920/
ll
cp ../condadock/* .
cp -r ../condadock/* .
sudo cp -r ../condadock/* .
ll
cd bak_wrapper/
ll
..
ll
..
ll
mv 180920/ phytoshell/
cd phytoshell/
ll
mv 180920/ .180920_backup
ll
cd ver
l
..
cd bak_wrapper/
l
ll
mv ../ver/ .
ll
..
ll
mv .180920_backup/ bak_wrapper/
mv bak_wrapper/ .backup
ll
git add -A
git commit -m "Docker image nstalls 5 languages, wrapper and runner determine CyVerse or OSG configuration, ticket parsing, etc"
git push -u origin master
l
docker build -t phytoshell .
docker tag phytoshell:latest jbustamante35/testphytoshell:phytoshell 
docker push jbustamante35/testphytoshell:phytoshell 
cdes
cd carrotsweeper/
ll
subl README.md 
..
bat */README.md
cd HypoQuantyl/
subl README.md 
dok
cd phytoshell/
ll
git pull origin master
ll
vim README.md 
ll
git pull origin master
ll
bat LICENSE 
ll
docker run -it phytoshell 0 na b__
exit
l
sshx
cba
sbc
sshx
exit
cd bin
bat triplethreat.sh 
dr
cdes
ll
cd cad
l
okular OpenCAD_cheatsheet.pdf 
ll
mv Drawing 1.dwg drawing1.dwg
head drawing1.dwg 
ll
h
cd -
ll
bat cylinders.scad 
vim cylinders.scad 
ll
sceen
screen
exit
dok
cd condadock/
l
docker build -t condadock .
docker login 
docker tag condadock:latest jbustamante35/testphytoshell:condadock 
docker push jbustamante35/testphytoshell:condadock 
htop
h
screen
exit
sshx
term
cdes
cd sphinctolyzer/
ll
cd SphinctolyzerMain/
ll
vim ProgressBar.m 
ll
vim Sphinctozord.m 
vim Sphinctotron.m 
ll
l
ll
rm .Sphinctolyzer.m.swp 
cd InitializeParameters/
ll
git status
git add -A
git commit -m "deleted some old files"
git push -u origin master 
exit
screen
ll
cdes
ll
mv HypoQuantyl/ hypoquantyl
mv QD2/ quantdracala
cd quantdracala/
ll
cd QuantDRaCALA/
ll
..
mv QuantDRaCALA/ quantdracala
ll
cd TestData/
ll
..
ll
cd quantdracala/
l
ls *
cd ../..
ll
cd sphinctolyzer/
ll
mv SphinctolyzerMain/ main
mv SampleData/ sampledata
mv PlottingTools/ plots
mv Misc/ misc
ll
ls *
cd main/
ll
mkdir classes
mv Sphincto* classes/
ll
mv ProgressBar.m classes/
mv BatchMode/Sphinctobatch.m classes/
cd BatchMode/
ll
bat *.m
ll
..
ll
mv BatchMode/*.m classes/
ll
cd LiveWireAlgorithm/
ll
bat *.m
ll
..
ll
cd InitializeParameters/
ll
bat ParameterChecks.m 
ll
bat InitializeParameters.m 
ll
cd GUI_helpers/
ll
..
ll
mv GUI_helpers/ gui_helpers
..
ll
mv BatchMode/ batch_mode
mv InitializeParameters/ initialize_parameters
mv LiveWireAlgorithm/ livewire
ll
cd batch_mode/
ll
mv BM_helpers/ batchmode_helpers
cd batchmode_helpers/
ll
cd ../..
ll
cd initialize_parameters/
ll
cd ../
ll
cd livewire/
ll
mv LW_helpers/ livewire_helpers
ll
..
ll
ls *
..
ll
ls *
cd plots/
ll
mv Plot_helpers/ plot_helpers
mv UnknownPlotters/ .unknown_plotters
ll
..
ll
cd plots/
ll
bat SphinctoPlotter.m 
ll
..
ll
ls *
cd sampledata/
ll
mv Data/ data
mv Images/ images
ls *
cd data/
ll
mv BatchData/ batchdata
..
ll
cd images/
ll
..
ll
..
ll
ls *
cd misc/
ll
mv UnusedCode/ .unused
ll
cd Images/
ll
..
ll
mv Images/ logos
ll
cd logos/
ll
cd ..
ll
cd ..
ll
ls */*
ls */*/*
cd main/livewire/livewire_helpers/
ll
mv DijkstraAlgorithm/ dijkstra
ll
cd dijkstra/
ll
cd testCompile/
ll
..
ll
mv testCompile/ test_compile
cd ..
ll
cd ..
ll
cd ..
ll
cd ..
ll
git add -A
git commit -m "directory name changes"
git push origin master
ll
..
ll
cd Misc/
ll
..
mv Misc/ misc
ll
ls *
shutdown 
exit
sshx
dr
ll
cd EdgarSpalding/Software/
ll
mv hypoquantyl/ hypoquantyls
mv hypoquantyls/ hypoquantyl
cd hypoquantyl/
ll
mv MainClasses/ classes
cd Helpers/
ll
..
mv Helpers/ helper
ll
mv Plots/ plot
mv plot/ plots
mv SampleData/ sample
mv sample/ sampledata
mv TestProgram/ test
ll
ls *
cd plots/
ll
mv assessPatches/ image_patches
cd assessPCA/
ll
..
ll
mv assessPCA/ check_pca
mv sweepPCA sweep_pca
ll
ls *
rm sweepPCA.zip 
ll
..
ll
ls *
cd helpers/
ll
ls *
cd pca/
mv multiPCA/ multi_pca
ll
..
ll
ls *
..
ll
..
ll
ls *
dropbox status
mv hypoquantyl/ hyp
mv hyp/ hypoquantyl
dropbox status
ll
ll */*/*
ll
mv hypoquantyl/ hypoquantyls
ll
dropbox status
ll
lspci
ll
dff
D
me2you OpenSCAD-Nightly-0-Build2364.1.glibc2.14-x86_64.AppImage ~/Documents
sudo chmod a+x OpenSCAD-Nightly-0-Build2364.1.glibc2.14-x86_64.AppImage 
./OpenSCAD-Nightly-0-Build2364.1.glibc2.14-x86_64.AppImage 
l
ll
dr
cd ResearchArticles/computational_biology/edgarspalding/image_analysis/
l
cd image_processing/
l
mv Stereo\ Image\ Registration\ Algorithm\ \(\;1981\).pdf "Stereo Image Registration Algorithm (Lucas, Kanade;1981).pdf" 
sshx
exit
l
sshx
exit
dr
dropbox status
cd EdgarSpalding/Software/sphinctolyzer/
ll
mv sampledata/ sampledatas
mv sampledatas/ sampledata
ll
mv misc/ miscs
mv miscs/ misc
ls *
..
ll
ls hypoquantyl
ls hypoquantyls
ll
rmdir hypoquantyl
ll
mv hypoquantyls/ hypoquantyl
ll
cd hypoquantyl/
ll
git status
git pull origin master
ll
..
ll
rmdir hypoquantyls
ll
cd hypoquantyl/
ll
git reset --hard
ll
git diff
ll
..
ll
cd hypoquantyl/
ll
git rebase origin/master 
ll
git reset HEAD^ --hard
ll
git pull origin master
ll
..
ll
cd hypoquantyl/
ll
RM *
ll
git pull origin master
ll
git checkout master
ll
git pull origin master
ll
git fetch origin matser
git fetch origin master
ll
git pull master
git pull origin master
ll
cd ..
ll
cd hypoquantyl/
ll
git rebase origin/master 
git status
git reset HEAD^ --hard
ll
ls */*/*
ll
git status
git pull origin master
ll
git status
ll
mv TestProgram/ tests
mv SampleData/ sample
mv sample/ sampledata
mv MainClasses/ classes
mv Helpers/ helper
ls
mv Plots/ plot
dropbox status
mv helper/ helpers
mv plot/ plots
dropbox status
ls */*/*
ls */*/* |less
term
ll
ls *
cd plots/
ll
mv assessPatches/image_patches
mv assessPatches/ image_patches
mv assessPCA/ check_pca
mv sweepPCA/ sweep_pca
ll
ls *
..
ll
cd helpers/
ll
cd ../plots/
l
..
ll
cd tests/
ll
cd ../sampledata/
ll
cd ../helpers/
ll
ls *
cd pca/
ll
mv multiPCA/ multi_pca
ll
ls *
..
l
ls *
..
ll
ls *
dropbox status
ll
git status
git add -A
git commit -m "changed directory names"
git push origin master
vim ~/.vimrc
ll
term
mnt
cat /etc/fstab 
cat ../cad/hexagon.s
cat ../cad/hexagon.stl 
bat ../cad/hexagon.stl 
ll
l
exit
term
sshx
exit
triplethreat.sh 
screen
shutdown 
exit
pcupdate 
cd /usr/local/
l
cd lib/
l
..
ll
sudo mv julia/ lib/
cd lib/
l
cd MATLAB/
l
cd R2018b/
l
ll
..
ll
sudo chown -R jbustamante:jbustamante *
ll
dr
cd EdgarSpalding/Software/sphinctolyzer/main/batch_mode/
l
mv batchmode_helpers/* .
l
rmdir batchmode_helpers/
l
ll
..
ll
cd plots/.unknown_plotters/
ll
bat *.m
ll
term
ll
exit
dr
ll
cd EdgarSpalding/Software/sphinctolyzer/
ll
git status
l
ll
cd main
l
cd classes/
l
which matlab
ll /usr/local/bin/matlab 
matlab
shutdown 
exit
pcupdate 
dok
cd phytoshell/
l
cd langtest/
l
bat DEwrapper.py
..
ll
l
bat runner
docker run -it phytoshell 0 na p_o_DEwrapper 
exit
ll
l
h
dok
cd phytoshell/
ll
exit
dr
cd EdgarSpalding/
l
term
cd ..
l
cd KevinBill/
l
cd KevillLab_code/
l
ls *
l
..
l
cd Sphinctalyzer/
l
ll
ls *
ncdu
ll
cd Sphinctalyzer_bak/
ll
cd Sphinctalyzer10312015/
ll
l
cd poi_library/
l
..
l
bat SphinctalyzerPlotter.m 
subl SphinctalyzerPlotter.m 
l
cd ~/Dropbox/EdgarSpalding/Software/sphinctolyzer/plots/
l
..
l
cd sampledata/data/
l
ll
dff
term
ll
cd batchdata/
l
..
ll
htop
l
..
cd KevinBill/
l
cd Sphinctalyzer/
l
cd sphinctolyzer/
l
cd PlottingTools/
l
subl SphinctoPlotter.m 
shutdown 
exit
term
dr
cd EdgarSpalding/Software/sphinctolyzer/
ll
cd sampledata/
ll
cd data/
l
..
ll
cd images/
ll
matlab
ll
matlab
exit
dr
term
cd EdgarSpalding/Software/sphinctolyzer/
ll
cd ../..
l
cd ../KevinBill/
ll
cd Sphinctalyzer/
ll
ls *
l
cd Sphinctalyzer_bak/
ll
..
cd sphinctolyzer/
ll
git pull origin master
l
..
l
cd Sphinctalyzer_bak/
l
cd BillSphinctalyzer/
l
exit
dr
cd EdgarSpalding/Software/sphinctolyzer/
ll
git status
term
l
ll
cd sampledata/
l
ll
..
l
cd plots/
ll
cd plot_helpers/
ll
..
xkill
l
dff
xkill
exit
triplethreat.sh 
screen
exit
shutdown -c
dr
dropbox status
cd EdgarSpalding/Software/sphinctolyzer/
ll
cd plots/
ll
subl SphinctoPlotter.m 
shutdown 0
man sudo
bat .gitconfig 
ls /*
bat .gitconfig 
ls /*
bat .gitconfig 
zsh
ll
l
ll
cp ~/Dropbox/ComputerProgramming/configstore/rintohsaka/.zsh* .
ll
zsh
apt search oh-my-zsh
chsh -s /bin/zsh 
echo $SHELL
chsh -s /usr/bin/zsh 
echo $SHELL
which zsh
chsh -s /bin/zsh 
echo $SHELL
chsh -s /bin/zsh root
sudo chsh -s /bin/zsh root
echo $SHELL
chsh -s /bin/zsh
h
l
h
app install zsh
app search zsh
apt search zsh
app install zsh zsh-common zsh-syntax-highlighting zsh-theme-powerlevel9k 
sudo app install zsh zsh-common zsh-syntax-highlighting zsh-theme-powerlevel9k 
app install zsh zsh-common zsh-syntax-highlighting zsh-theme-powerlevel9k 
ll
cd Dropbox/
l
cd ComputerProgramming/configstore/
l
ll
cp syncconfigs.sh ~/bin
vim syncconfigs.sh 
vim ~/bin/syncconfigs.sh 
mkdir winryrockbell
syncconfigs.sh 
ll
cd winryrockbell/
ll
screen
zsh
echo $SHELL
shutdown 
shutdown -c
shutdown 0
triplethreat.sh 
leftGuy.sh 
shutdown 0
apt search bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
cd .bash_it/
l
./install.sh 
h
cp .bashrc .bashrcbak
cd .bash_it/
./install.sh 
h
ll
h
vim .bashrc
ll
l
cp Dropbox/ComputerProgramming/configstore/rintohsaka/.bashrc .
ll
vim .bashrc
h
apt search devtodo
app install devtodo
welcome_to_go 
cd go/src/apps/
ll
go get github.com/droundy/goopt
git clone git://github.com/alecthomas/devtodo2.git
cd devtodo2/
make install 
sudo make install 
l
todo
todo --help
..
go get gopkg.in/alecthomas/kingpin.v2"
go get gopkg.in/alecthomas/kingpin.v2
l
cd devtodo2/
make install 
sudo make install 
todo2 --help
cd /usr/local/
ll
cd bin
ll
..
cd bin
ls
ll todo*
mv todo ../local/bin
sudo mv todo ../local/bin
sudo mv devtodo ../local/bin/
cd ../local/bin/
ll
cd /usr/local/
l
cd lib/
l
cd ../bin/
ll
sudo ln -sf /usr/local/lib/julia/julia-1.0.0/bin/julia julia
ll
h
bi
source .bashrc
l
bi
source .shortcuts 
h
l
bi
cff
sbc
h
bi
cd plugins/
l
cd available/
l
ls
bash-it show plugins 
bash-it enable plugin extract
bash-it enable plugin history 
bash-it enable plugin fasd
bash-it enable plugin edit-mode-vi
bash-it enable plugin battery
vim less-pretty-cat.plugin.bash 
bash-it enable plugin less-pretty-cat 
